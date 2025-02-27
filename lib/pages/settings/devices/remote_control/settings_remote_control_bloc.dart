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

import 'package:equatable/equatable.dart';
import 'package:super_green_app/data/logger/logger.dart';
import 'package:super_green_app/misc/bloc.dart';
import 'package:super_green_app/data/api/backend/backend_api.dart';
import 'package:super_green_app/data/api/device/device_helper.dart';
import 'package:super_green_app/data/kv/app_db.dart';
import 'package:super_green_app/data/kv/models/device_data.dart';
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:super_green_app/main/main_navigator_bloc.dart';

abstract class SettingsRemoteControlBlocEvent extends Equatable {}

class SettingsRemoteControlBlocEventInit extends SettingsRemoteControlBlocEvent {
  @override
  List<Object> get props => [];
}

class SettingsRemoteControlBlocEventPair extends SettingsRemoteControlBlocEvent {
  @override
  List<Object> get props => [];
}

abstract class SettingsRemoteControlBlocState extends Equatable {}

class SettingsRemoteControlBlocStateInit extends SettingsRemoteControlBlocState {
  @override
  List<Object> get props => [];
}

class SettingsRemoteControlBlocStateLoaded extends SettingsRemoteControlBlocState {
  final Device device;
  final bool signingSetup;
  final bool loggedIn;
  final bool needsUpgrade;

  SettingsRemoteControlBlocStateLoaded(this.device,
      {required this.signingSetup, required this.loggedIn, required this.needsUpgrade});

  @override
  List<Object?> get props => [
        device,
        signingSetup,
        loggedIn,
        needsUpgrade,
      ];
}

class SettingsRemoteControlBlocStateLoading extends SettingsRemoteControlBlocState {
  @override
  List<Object> get props => [];
}

class SettingsRemoteControlBlocStateDonePairing extends SettingsRemoteControlBlocState {
  final Device device;

  SettingsRemoteControlBlocStateDonePairing(this.device);

  @override
  List<Object> get props => [device];
}

class SettingsRemoteControlBloc extends LegacyBloc<SettingsRemoteControlBlocEvent, SettingsRemoteControlBlocState> {
  final MainNavigateToSettingsRemoteControl args;

  SettingsRemoteControlBloc(this.args) : super(SettingsRemoteControlBlocStateInit()) {
    add(SettingsRemoteControlBlocEventInit());
  }

  @override
  Stream<SettingsRemoteControlBlocState> mapEventToState(SettingsRemoteControlBlocEvent event) async* {
    if (event is SettingsRemoteControlBlocEventInit) {
      DeviceData deviceData = AppDB().getDeviceData(args.device.identifier);
      Param otaTimestamp = await RelDB.get().devicesDAO.getParam(args.device.id, 'OTA_TIMESTAMP');
      yield SettingsRemoteControlBlocStateLoaded(
        args.device,
        signingSetup: deviceData.signing != null,
        loggedIn: AppDB().getAppData().jwt != null,
        needsUpgrade: otaTimestamp.ivalue! <= BackendAPI.lastBeforeRemoteControlTimestamp,
      );
    } else if (event is SettingsRemoteControlBlocEventPair) {
      yield SettingsRemoteControlBlocStateLoading();
      try {
        await DeviceHelper.pairDevice(args.device);
      } catch (e, trace) {
        Logger.logError(e, trace);
      }
      await Future.delayed(Duration(seconds: 1));
      yield SettingsRemoteControlBlocStateDonePairing(args.device);
    }
  }
}
