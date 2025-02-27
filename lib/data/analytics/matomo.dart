import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_green_app/data/logger/logger.dart';
import 'package:uuid/uuid.dart';

abstract class TraceableStatelessWidget extends StatelessWidget {
  final String name;

  const TraceableStatelessWidget({this.name = '', Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    MatomoTracker.trackScreenWithName(this.name.isEmpty ? this.runtimeType.toString() : this.name);
    return StatelessElement(this);
  }
}

abstract class TraceableStatefulWidget extends StatefulWidget {
  final String name;

  const TraceableStatefulWidget({this.name = '', Key? key}) : super(key: key);

  @override
  StatefulElement createElement() {
    MatomoTracker.trackScreenWithName(this.name.isEmpty ? this.runtimeType.toString() : this.name);
    return StatefulElement(this);
  }
}

abstract class TraceableInheritedWidget extends InheritedWidget {
  final String name;

  const TraceableInheritedWidget({this.name = '', Key? key, required Widget child}) : super(key: key, child: child);

  @override
  InheritedElement createElement() {
    MatomoTracker.trackScreenWithName(this.name.isEmpty ? this.runtimeType.toString() : this.name);
    return InheritedElement(this);
  }
}

class MatomoTracker {
  static const String kFirstVisit = 'matomo_first_visit';
  static const String kLastVisit = 'matomo_last_visit';
  static const String kVisitCount = 'matomo_visit_count';
  static const String kVisitorId = 'matomo_visitor_id';
  static const String kOptOut = 'matomo_opt_out';

  late _MatomoDispatcher _dispatcher;

  static MatomoTracker _instance = MatomoTracker.internal();
  MatomoTracker.internal();
  factory MatomoTracker() => _instance;

  late int siteId;
  late String url;
  late _Session session;
  late _Visitor visitor;
  late String userAgent;
  late String contentBase;
  late int width;
  late int height;

  bool initialized = false;
  bool _optout = false;

  late SharedPreferences _prefs;

  Queue<_Event> _queue = Queue();
  late Timer _timer;

  initialize({required int siteId, required String url, String? visitorId}) async {
    this.siteId = siteId;
    this.url = url;

    _dispatcher = _MatomoDispatcher(url);

    // User agent
    userAgent = "SGL/4.2.0";

    // Screen Resolution
    width = window.physicalSize.width.toInt();
    height = window.physicalSize.height.toInt();

    // Initialize Session Information
    var firstVisit = DateTime.now().toUtc();
    var lastVisit = DateTime.now().toUtc();
    var visitCount = 1;

    _prefs = await SharedPreferences.getInstance();

    if (_prefs.containsKey(kFirstVisit)) {
      firstVisit = DateTime.fromMillisecondsSinceEpoch(_prefs.getInt(kFirstVisit)!);
    } else {
      _prefs.setInt(kFirstVisit, firstVisit.millisecondsSinceEpoch);
    }

    if (_prefs.containsKey(kLastVisit)) {
      lastVisit = DateTime.fromMillisecondsSinceEpoch(_prefs.getInt(kLastVisit)!);
    }
    // Now is the last visit.
    _prefs.setInt(kLastVisit, lastVisit.millisecondsSinceEpoch);

    if (_prefs.containsKey(kVisitCount)) {
      visitCount += _prefs.getInt(kVisitCount)!;
    }
    _prefs.setInt(kVisitCount, visitCount);

    session = _Session(firstVisit: firstVisit, lastVisit: lastVisit, visitCount: visitCount);

    // Initialize Visitor
    if (visitorId == null) {
      visitorId = Uuid().v4().toString();
      if (_prefs.containsKey(kVisitorId)) {
        visitorId = _prefs.getString(kVisitorId);
      } else {
        _prefs.setString(kVisitorId, visitorId);
      }
    }
    visitor = _Visitor(id: visitorId, forcedId: null, userId: visitorId);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    contentBase = 'https://${packageInfo.packageName}';

    if (_prefs.containsKey(kOptOut)) {
      _optout = _prefs.getBool(kOptOut)!;
    } else {
      _prefs.setBool(kOptOut, _optout);
    }

    Logger.log(
        'Matomo Initialized: firstVisit=$firstVisit; lastVisit=$lastVisit; visitCount=$visitCount; visitorId=$visitorId; contentBase=$contentBase; resolution=${width}x$height; userAgent=$userAgent');
    this.initialized = true;

    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      this._dequeue();
    });
  }

  bool get optOut => _optout;

  void setOptOut(bool optout) {
    _optout = optout;
    _prefs.setBool(kOptOut, _optout);
  }

  void clear() {
    _prefs.remove(kFirstVisit);
    _prefs.remove(kLastVisit);
    _prefs.remove(kVisitCount);
    _prefs.remove(kVisitorId);
  }

  void dispose() {
    _timer.cancel();
  }

  static void dispatchEvents() {
    var tracker = MatomoTracker();
    if (tracker.initialized) {
      tracker._dequeue();
    }
  }

  static void trackScreen(BuildContext context) {
    var widgetName = context.widget.toStringShort();
    trackScreenWithName(widgetName);
  }

  static void trackScreenWithName(String widgetName) {
    var tracker = MatomoTracker();
    tracker._track(_Event(
      tracker: tracker,
      action: widgetName,
    ));
  }

  static void trackGoal(int goalId, {double? revenue}) {
    var tracker = MatomoTracker();
    tracker._track(_Event(
      tracker: tracker,
      goalId: goalId,
      revenue: revenue,
    ));
  }

  static void trackEvent(String eventCategory, String eventName, String eventAction) {
    var tracker = MatomoTracker();
    tracker._track(_Event(
      tracker: tracker,
      eventAction: eventAction,
      eventName: eventName,
      eventCategory: eventCategory,
    ));
  }

  void _track(_Event event) {
    _queue.add(event);
  }

  void _dequeue() {
    assert(initialized);
    //Logger.log('Processing queue ${_queue.length}');
    while (_queue.length > 0) {
      var event = _queue.removeFirst();
      if (!_optout) {
        _dispatcher.send(event);
      }
    }
  }
}

class _Session {
  final DateTime firstVisit;
  final DateTime lastVisit;
  final int visitCount;

  _Session({required this.firstVisit, required this.lastVisit, required this.visitCount});
}

class _Visitor {
  final String? id;
  final String? forcedId;
  final String? userId;

  _Visitor({this.id, this.forcedId, this.userId});
}

class _Event {
  final MatomoTracker tracker;
  final String? action;
  final String? eventCategory;
  final String? eventAction;
  final String? eventName;
  final int? goalId;
  final double? revenue;

  late DateTime _date;

  _Event(
      {required this.tracker,
      this.action,
      this.eventCategory,
      this.eventAction,
      this.eventName,
      this.goalId,
      this.revenue}) {
    _date = DateTime.now().toUtc();
  }

  Map<String, dynamic> toMap() {
    // Based from https://developer.matomo.org/api-reference/tracking-api
    // https://github.com/matomo-org/matomo-sdk-ios/blob/develop/MatomoTracker/EventAPISerializer.swift
    var map = new Map<String, dynamic>();
    map['idsite'] = this.tracker.siteId.toString();
    map['rec'] = 1;

    map['rand'] = Random().nextInt(1000000000);
    map['apiv'] = 1;
    map['cookie'] = 1;

    // Visitor
    map['_id'] = this.tracker.visitor.id;
    if (this.tracker.visitor.forcedId != null) {
      map['cid'] = this.tracker.visitor.forcedId;
    }
    map['uid'] = this.tracker.visitor.userId;

    // Session
    map['_idvc'] = this.tracker.session.visitCount.toString();
    map['_viewts'] = this.tracker.session.lastVisit.millisecondsSinceEpoch ~/ 1000;
    map['_idts'] = this.tracker.session.firstVisit.millisecondsSinceEpoch ~/ 1000;

    map['url'] = '${this.tracker.contentBase}/$action';
    map['action_name'] = action;

    final locale = window.locale;
    map['lang'] = locale.toString();

    map['h'] = _date.hour.toString();
    map['m'] = _date.minute.toString();
    map['s'] = _date.second.toString();
    map['cdt'] = _date.toIso8601String();

    // Screen Resolution
    map['res'] = '${this.tracker.width}x${this.tracker.height}';

    // Goal
    if (goalId != null && goalId! > 0) {
      map['idgoal'] = goalId;
    }
    if (revenue != null && revenue! > 0) {
      map['revenue'] = revenue;
    }

    // Event
    if (eventCategory != null) {
      map['e_c'] = eventCategory;
    }
    if (eventAction != null) {
      map['e_a'] = eventAction;
    }
    if (eventName != null) {
      map['e_n'] = eventName;
    }
    return map;
  }
}

class _MatomoDispatcher {
  final String baseUrl;

  _MatomoDispatcher(this.baseUrl);

  void send(_Event event) {
    var headers = {
      if (!kIsWeb) 'User-Agent': event.tracker.userAgent,
    };

    var map = event.toMap();
    var url = '$baseUrl?';
    for (String key in map.keys) {
      var value = Uri.encodeFull(map[key].toString());
      url = '$url$key=$value&';
    }
    //Logger.log(' -> $url');
    http.post(Uri.parse(url), headers: headers).then((http.Response response) {
      final int statusCode = response.statusCode;
      //Logger.log(' <- $statusCode');
      if (statusCode != 200) {}
    }).catchError((e) {
      Logger.throwError(e.toString(), data: map, fwdThrow: false);
    });
  }
}
