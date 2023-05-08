/*
 * Copyright (C) 2022  SuperGreenLab <towelie@supergreenlab.com>
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

import 'package:equatable/equatable.dart';
import 'package:super_green_app/data/api/device/device_helper.dart';
import 'package:super_green_app/data/rel/rel_db.dart';

class ParamController extends Equatable {
  final Param param;
  final int value;
  final int initialValue;

  int get ivalue => param.ivalue!;

  bool get isChanged => value != initialValue;

  ParamController(this.param, this.value, this.initialValue);

  ParamController copyWith({Param? param, int? value, int? initialValue}) =>
      ParamController(param ?? this.param, value ?? this.value, initialValue ?? this.initialValue);

  Future<ParamController> refreshParam(Device device) async {
    return this.copyWith(param: await DeviceHelper.refreshIntParam(device, param));
  }

  Future<ParamController> syncParam(Device device) async {
    if (value != param.ivalue) {
      Param p = await DeviceHelper.updateIntParam(device, param, value);
      return this.copyWith(param: p, value: p.ivalue);
    }
    return this;
  }

  Future<ParamController> cancelParam(Device device) async {
    if (initialValue != param.ivalue) {
      Param p = await DeviceHelper.updateIntParam(device, param, initialValue);
      return this.copyWith(param: p);
    }
    return this;
  }

  StreamSubscription<Param> listenParam(Device device, void Function(Param?) fn) {
    return RelDB.get().devicesDAO.watchParam(device.id, param.key).listen(fn);
  }

  static Future<ParamController> loadFromDB(Device device, String key) async {
    Param p = await RelDB.get().devicesDAO.getParam(device.id, key);
    return ParamController(p, p.ivalue!, p.ivalue!);
  }

  @override
  List<Object?> get props => [param, value, initialValue];
}

abstract class ParamsController extends Equatable {
  final Map<String, ParamController> params;

  ParamsController({required this.params});

  Future<ParamController> loadParam(Device device, String key, name) async {
    ParamController pc = await ParamController.loadFromDB(device, key);
    params[name] = pc;
    return pc;
  }

  Future<ParamController> loadBoxParam(Device device, Box box, String key, name) async {
    return this.loadParam(device, "BOX_${box.deviceBox}_$key", name);
  }

  List<StreamSubscription<Param>> listenParams(Device device, void Function(ParamsController) fn) {
    List<StreamSubscription<Param>> subscriptions = params.keys.map<StreamSubscription<Param>>((String key) {
      ParamController p = params[key]!;
      return p.listenParam(device, (p0) {
        p = p.copyWith(param: p0);
        params[key] = p;
        fn(this.copyWith(params: {...params}));
      });
    }).toList();
    return subscriptions;
  }

  Future<ParamsController> refreshParams(Device device) async {
    Map<String, ParamController> p = {};
    await Future.wait(params.keys.map<Future>((String key) async {
      p[key] = await params[key]!.refreshParam(device);
    }).toList());
    return this.copyWith(params: p);
  }

  Future<ParamsController> syncParams(Device device) async {
    Map<String, ParamController> p = {};
    await Future.wait(params.keys.map<Future>((String key) async {
      p[key] = await params[key]!.syncParam(device);
    }).toList());
    return this.copyWith(params: p);
  }

  Future<ParamsController> cancelParams(Device device) async {
    Map<String, ParamController> p = {};
    await Future.wait(params.keys.map<Future>((String key) async {
      p[key] = await params[key]!.cancelParam(device);
    }).toList());
    return this.copyWith(params: p);
  }

  Future closeSubscriptions(List<StreamSubscription<Param>> subscriptions) async {
    await Future.wait(subscriptions.map<Future>((s) => s.cancel()));
  }

  ParamsController copyWithValues(Map<String, int> values) {
    Map<String, ParamController> p = {...params};
    values.forEach((key, value) {
      p[key] = params[key]!.copyWith(value: value);
    });
    return this.copyWith(params: p);
  }

  bool isChanged() => params.values.any((p) => p.isChanged);

  ParamsController copyWith({Map<String, ParamController>? params});

  @override
  List<Object?> get props => [...params.values];
}
