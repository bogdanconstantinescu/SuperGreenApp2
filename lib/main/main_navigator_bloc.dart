/*
 * Copyright (C) 2018  SuperGreenLab <towelie@supergreenlab.com>
 * Author: Constantin Clauzel <constantin.clauzel@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:super_green_app/data/backend/time_series/time_series.dart';
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MainNavigatorEvent extends Equatable {
  final void Function(Future<dynamic> future) futureFn;

  MainNavigatorEvent({this.futureFn});

  @override
  List<Object> get props => [futureFn];
}

class MainNavigateToHomeEvent extends MainNavigatorEvent {
  MainNavigateToHomeEvent();

  @override
  List<Object> get props => [];
}

class MainNavigateToNewPlantInfosEvent extends MainNavigatorEvent {
  @override
  List<Object> get props => [];
}

class MainNavigateToSelectPlantDeviceEvent extends MainNavigatorEvent {
  MainNavigateToSelectPlantDeviceEvent({futureFn}) : super(futureFn: futureFn);
}

class MainNavigateToSelectPlantDeviceBoxEvent extends MainNavigatorEvent {
  final Device device;

  MainNavigateToSelectPlantDeviceBoxEvent(this.device, {futureFn})
      : super(futureFn: futureFn);

  @override
  List<Object> get props => [device];
}

class MainNavigateToSelectPlantNewDeviceBoxEvent extends MainNavigatorEvent {
  final Device device;

  MainNavigateToSelectPlantNewDeviceBoxEvent(this.device, {futureFn})
      : super(futureFn: futureFn);

  @override
  List<Object> get props => [device];
}

class MainNavigateToAddDeviceEvent extends MainNavigatorEvent {
  MainNavigateToAddDeviceEvent({futureFn}) : super(futureFn: futureFn);

  @override
  List<Object> get props => [];
}

class MainNavigateToNewDeviceEvent extends MainNavigatorEvent {
  MainNavigateToNewDeviceEvent({futureFn}) : super(futureFn: futureFn);

  @override
  List<Object> get props => [];
}

class MainNavigateToExistingDeviceEvent extends MainNavigatorEvent {
  MainNavigateToExistingDeviceEvent({futureFn}) : super(futureFn: futureFn);

  @override
  List<Object> get props => [];
}

class MainNavigateToDeviceSetupEvent extends MainNavigatorEvent {
  final ip;

  MainNavigateToDeviceSetupEvent(this.ip, {futureFn})
      : super(futureFn: futureFn);

  @override
  List<Object> get props => [ip];
}

class MainNavigateToDeviceNameEvent extends MainNavigatorEvent {
  final Device device;
  MainNavigateToDeviceNameEvent(this.device, {futureFn})
      : super(futureFn: futureFn);

  @override
  List<Object> get props => [device];
}

class MainNavigateToDeviceTestEvent extends MainNavigatorEvent {
  final Device device;
  MainNavigateToDeviceTestEvent(this.device, {futureFn})
      : super(futureFn: futureFn);

  @override
  List<Object> get props => [device];
}

class MainNavigateToFeedFormEvent extends MainNavigatorEvent {
  final bool pushAsReplacement;

  MainNavigateToFeedFormEvent(this.pushAsReplacement);

  @override
  List<Object> get props => [pushAsReplacement];
}

class MainNavigateToFeedLightFormEvent extends MainNavigateToFeedFormEvent {
  final Plant plant;

  MainNavigateToFeedLightFormEvent(this.plant, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigateToFeedWaterFormEvent extends MainNavigateToFeedFormEvent {
  final Plant plant;

  MainNavigateToFeedWaterFormEvent(this.plant, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigateToFeedVentilationFormEvent
    extends MainNavigateToFeedFormEvent {
  final Plant plant;

  MainNavigateToFeedVentilationFormEvent(this.plant, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigateToFeedMediaFormEvent extends MainNavigateToFeedFormEvent {
  final Plant plant;

  MainNavigateToFeedMediaFormEvent(this.plant, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigateToFeedMeasureFormEvent extends MainNavigateToFeedFormEvent {
  final Plant plant;

  MainNavigateToFeedMeasureFormEvent(this.plant, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigateToFeedCareCommonFormEvent
    extends MainNavigateToFeedFormEvent {
  final Plant plant;

  MainNavigateToFeedCareCommonFormEvent(this.plant, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigateToFeedDefoliationFormEvent
    extends MainNavigateToFeedCareCommonFormEvent {
  MainNavigateToFeedDefoliationFormEvent(Plant plant, {pushAsReplacement = false})
      : super(plant, pushAsReplacement: pushAsReplacement);
}

class MainNavigateToFeedToppingFormEvent
    extends MainNavigateToFeedCareCommonFormEvent {
  MainNavigateToFeedToppingFormEvent(Plant plant, {pushAsReplacement = false})
      : super(plant, pushAsReplacement: pushAsReplacement);
}

class MainNavigateToFeedFimmingFormEvent
    extends MainNavigateToFeedCareCommonFormEvent {
  MainNavigateToFeedFimmingFormEvent(Plant plant, {pushAsReplacement = false})
      : super(plant, pushAsReplacement: pushAsReplacement);
}

class MainNavigateToFeedBendingFormEvent
    extends MainNavigateToFeedCareCommonFormEvent {
  MainNavigateToFeedBendingFormEvent(Plant plant, {pushAsReplacement = false})
      : super(plant, pushAsReplacement: pushAsReplacement);
}

class MainNavigateToFeedTransplantFormEvent
    extends MainNavigateToFeedCareCommonFormEvent {
  MainNavigateToFeedTransplantFormEvent(Plant plant, {pushAsReplacement = false})
      : super(plant, pushAsReplacement: pushAsReplacement);
}

class MainNavigateToFeedScheduleFormEvent extends MainNavigateToFeedFormEvent {
  final Plant plant;

  MainNavigateToFeedScheduleFormEvent(this.plant, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigateToTipEvent extends MainNavigatorEvent {
  final List<String> paths;
  final MainNavigateToFeedFormEvent nextRoute;

  MainNavigateToTipEvent(this.paths, this.nextRoute);

  @override
  List<Object> get props => [nextRoute];
}

class MainNavigateToImageCaptureEvent extends MainNavigatorEvent {
  final bool videoEnabled;
  final bool pickerEnabled;
  final String overlayPath;

  MainNavigateToImageCaptureEvent(
      {Function(Future<Object> f) futureFn,
      this.videoEnabled = true,
      this.pickerEnabled = true,
      this.overlayPath})
      : super(futureFn: futureFn);

  @override
  List<Object> get props => [videoEnabled, overlayPath, futureFn];
}

class MainNavigateToImageCapturePlaybackEvent extends MainNavigatorEvent {
  final String cancelButton;
  final String okButton;

  final int rand = Random().nextInt(1 << 32);
  final String filePath;
  final String overlayPath;

  MainNavigateToImageCapturePlaybackEvent(this.filePath,
      {Function(Future<Object> f) futureFn,
      this.cancelButton = 'RETAKE',
      this.okButton = 'NEXT',
      this.overlayPath})
      : super(futureFn: futureFn);

  @override
  List<Object> get props => [rand, futureFn, filePath];
}

class MainNavigateToDeviceWifiEvent extends MainNavigatorEvent {
  final Device device;

  MainNavigateToDeviceWifiEvent(this.device, {futureFn})
      : super(futureFn: futureFn);

  @override
  List<Object> get props => [futureFn, device];
}

class MainNavigateToFullscreenMedia extends MainNavigatorEvent {
  final String overlayPath;
  final FeedMedia feedMedia;

  MainNavigateToFullscreenMedia(this.feedMedia, {this.overlayPath});

  @override
  List<Object> get props => [feedMedia];
}

class MainNavigateToFullscreenPicture extends MainNavigatorEvent {
  final String path;

  MainNavigateToFullscreenPicture(this.path);

  @override
  List<Object> get props => [path];
}

class MainNavigateToTimelapseHowto extends MainNavigateToFeedFormEvent {
  final Plant plant;

  MainNavigateToTimelapseHowto(this.plant, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigateToTimelapseSetup extends MainNavigateToFeedFormEvent {
  final Plant plant;

  MainNavigateToTimelapseSetup(this.plant, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigateToTimelapseConnect extends MainNavigateToFeedFormEvent {
  final Plant plant;

  MainNavigateToTimelapseConnect(this.plant, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigateToTimelapseViewer extends MainNavigateToFeedFormEvent {
  final Plant plant;

  MainNavigateToTimelapseViewer(this.plant, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigateToMetrics extends MainNavigateToFeedFormEvent {
  final List<charts.Series<Metric, DateTime>> graphData;
  final Plant plant;

  MainNavigateToMetrics(this.plant, this.graphData, {pushAsReplacement = false})
      : super(pushAsReplacement);

  @override
  List<Object> get props => [plant];
}

class MainNavigatorActionPop extends MainNavigatorEvent {
  final dynamic param;
  final bool mustPop;

  MainNavigatorActionPop({this.param, this.mustPop = false});

  @override
  List<Object> get props => [param];
}

class MainNavigatorActionPopToRoute extends MainNavigatorEvent {
  final String route;
  final dynamic param;
  final bool mustPop;

  MainNavigatorActionPopToRoute(this.route, {this.param, this.mustPop = false});

  @override
  List<Object> get props => [param];
}

class MainNavigatorActionPopToRoot extends MainNavigatorEvent {
  MainNavigatorActionPopToRoot();

  @override
  List<Object> get props => [];
}

class MainNavigatorBloc extends Bloc<MainNavigatorEvent, dynamic> {
  final GlobalKey<NavigatorState> _navigatorKey;
  MainNavigatorBloc(this._navigatorKey);

  @override
  dynamic get initialState => 0;

  @override
  Stream<dynamic> mapEventToState(MainNavigatorEvent event) async* {
    Future future;
    if (event is MainNavigatorActionPop) {
      if (event.mustPop) {
        _navigatorKey.currentState.pop(event.param);
      } else {
        _navigatorKey.currentState.maybePop(event.param);
      }
    } else if (event is MainNavigatorActionPopToRoute) {
      _navigatorKey.currentState.popUntil((r) {
        if (r.settings.name == event.route) {
          return true;
        }
        return false;
      });
    } else if (event is MainNavigatorActionPopToRoot) {
      _navigatorKey.currentState.popUntil((route) => route.isFirst);
    } else if (event is MainNavigateToHomeEvent) {
      future = _navigatorKey.currentState
          .pushReplacementNamed('/home', arguments: event);
    } else if (event is MainNavigateToNewPlantInfosEvent) {
      future =
          _navigatorKey.currentState.pushNamed('/plant/new', arguments: event);
    } else if (event is MainNavigateToSelectPlantDeviceEvent) {
      future =
          _navigatorKey.currentState.pushNamed('/plant/device', arguments: event);
    } else if (event is MainNavigateToSelectPlantDeviceBoxEvent) {
      future = _navigatorKey.currentState
          .pushNamed('/plant/device/box', arguments: event);
    } else if (event is MainNavigateToSelectPlantNewDeviceBoxEvent) {
      future = _navigatorKey.currentState
          .pushNamed('/plant/device/box/new', arguments: event);
    } else if (event is MainNavigateToAddDeviceEvent) {
      future =
          _navigatorKey.currentState.pushNamed('/device/add', arguments: event);
    } else if (event is MainNavigateToNewDeviceEvent) {
      future =
          _navigatorKey.currentState.pushNamed('/device/new', arguments: event);
    } else if (event is MainNavigateToExistingDeviceEvent) {
      future = _navigatorKey.currentState
          .pushNamed('/device/existing', arguments: event);
    } else if (event is MainNavigateToDeviceSetupEvent) {
      future = _navigatorKey.currentState
          .pushNamed('/device/load', arguments: event);
    } else if (event is MainNavigateToDeviceNameEvent) {
      future = _navigatorKey.currentState
          .pushNamed('/device/name', arguments: event);
    } else if (event is MainNavigateToDeviceTestEvent) {
      future = _navigatorKey.currentState
          .pushNamed('/device/test', arguments: event);
    } else if (event is MainNavigateToDeviceWifiEvent) {
      future = _navigatorKey.currentState
          .pushNamed('/device/wifi', arguments: event);
    } else if (event is MainNavigateToFeedLightFormEvent) {
      future = _pushOrReplace('/feed/form/light', event);
    } else if (event is MainNavigateToFeedMediaFormEvent) {
      future = _pushOrReplace('/feed/form/media', event);
    } else if (event is MainNavigateToFeedMeasureFormEvent) {
      future = _pushOrReplace('/feed/form/measure', event);
    } else if (event is MainNavigateToFeedScheduleFormEvent) {
      future = _pushOrReplace('/feed/form/schedule', event);
    } else if (event is MainNavigateToFeedToppingFormEvent) {
      future = _pushOrReplace('/feed/form/topping', event);
    } else if (event is MainNavigateToFeedDefoliationFormEvent) {
      future = _pushOrReplace('/feed/form/defoliation', event);
    } else if (event is MainNavigateToFeedFimmingFormEvent) {
      future = _pushOrReplace('/feed/form/fimming', event);
    } else if (event is MainNavigateToFeedBendingFormEvent) {
      future = _pushOrReplace('/feed/form/bending', event);
    } else if (event is MainNavigateToFeedTransplantFormEvent) {
      future = _pushOrReplace('/feed/form/transplant', event);
    } else if (event is MainNavigateToFeedVentilationFormEvent) {
      future = _pushOrReplace('/feed/form/ventilation', event);
    } else if (event is MainNavigateToFeedWaterFormEvent) {
      future = _pushOrReplace('/feed/form/water', event);
    } else if (event is MainNavigateToTipEvent) {
      future = _navigatorKey.currentState.pushNamed('/tip', arguments: event);
    } else if (event is MainNavigateToImageCaptureEvent) {
      future =
          _navigatorKey.currentState.pushNamed('/capture', arguments: event);
    } else if (event is MainNavigateToImageCapturePlaybackEvent) {
      future = _navigatorKey.currentState
          .pushNamed('/capture/playback', arguments: event);
    } else if (event is MainNavigateToFullscreenMedia) {
      future = future =
          _navigatorKey.currentState.pushNamed('/media', arguments: event);
    } else if (event is MainNavigateToFullscreenPicture) {
      future = future =
          _navigatorKey.currentState.pushNamed('/media', arguments: event);
    } else if (event is MainNavigateToTimelapseHowto) {
      future = _pushOrReplace('/timelapse/howto', event);
    } else if (event is MainNavigateToTimelapseSetup) {
      future = _pushOrReplace('/timelapse/setup', event);
    } else if (event is MainNavigateToTimelapseConnect) {
      future = _pushOrReplace('/timelapse/connect', event);
    } else if (event is MainNavigateToTimelapseViewer) {
      future = _pushOrReplace('/timelapse/viewer', event);
    } else if (event is MainNavigateToMetrics) {
      future = _pushOrReplace('/metrics', event);
    }
    if (event.futureFn != null) {
      event.futureFn(future);
    }
  }

  Future _pushOrReplace(String url, MainNavigateToFeedFormEvent event) {
    if (event.pushAsReplacement) {
      return _navigatorKey.currentState
          .pushReplacementNamed(url, arguments: event);
    }
    return _navigatorKey.currentState.pushNamed(url, arguments: event);
  }

  FutureFn futureFn() {
    Completer f = Completer();
    Function(Future) futureFn = (Future<dynamic> fu) async {
      var o = await fu;
      f.complete(o);
    };

    return FutureFn(futureFn, f.future);
  }
}

class FutureFn {
  final Function(Future) futureFn;
  final Future<dynamic> future;

  FutureFn(this.futureFn, this.future);
}
