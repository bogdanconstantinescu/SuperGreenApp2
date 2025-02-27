import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:super_green_app/misc/bloc.dart';
import 'package:super_green_app/data/api/device/device_helper.dart';
import 'package:super_green_app/data/logger/logger.dart';
import 'package:super_green_app/data/rel/rel_db.dart';

abstract class SunglassesBlocEvent extends Equatable {}

class SunglassesBlocEventInit extends SunglassesBlocEvent {
  @override
  List<Object> get props => [];
}

class SunglassesBlocEventOnOff extends SunglassesBlocEvent {
  final int rand = Random().nextInt(1 << 32);

  @override
  List<Object> get props => [rand];
}

abstract class SunglassesBlocState extends Equatable {}

class SunglassesBlocStateInit extends SunglassesBlocState {
  @override
  List<Object> get props => [];
}

class SunglassesBlocStateLoaded extends SunglassesBlocState {
  final bool sunglassesOn;

  SunglassesBlocStateLoaded(this.sunglassesOn);

  @override
  List<Object> get props => [sunglassesOn];
}

class SunglassesBloc extends LegacyBloc<SunglassesBlocEvent, SunglassesBlocState> {
  final int _deviceID;
  final int _deviceBox;

  SunglassesBloc(this._deviceID, this._deviceBox) : super(SunglassesBlocStateInit()) {
    add(SunglassesBlocEventInit());
  }

  @override
  Stream<SunglassesBlocState> mapEventToState(SunglassesBlocEvent event) async* {
    if (event is SunglassesBlocEventInit) {
      yield SunglassesBlocStateLoaded(await _isON());
    } else if (event is SunglassesBlocEventOnOff) {
      Device device = await RelDB.get().devicesDAO.getDevice(_deviceID);
      Param dimParam = await RelDB.get().devicesDAO.getParam(_deviceID, 'BOX_${_deviceBox}_LED_DIM');
      try {
        if (await _isON()) {
          await DeviceHelper.updateIntParam(device, dimParam, 0);
        } else {
          await DeviceHelper.updateIntParam(device, dimParam, DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000);
        }
      } catch (e, trace) {
        Logger.logError(e, trace);
      }
      yield SunglassesBlocStateLoaded(await _isON());
    }
  }

  Future<bool> _isON() async {
    Param dimParam = await RelDB.get().devicesDAO.getParam(_deviceID, 'BOX_${_deviceBox}_LED_DIM');
    int time = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000 - dimParam.ivalue!;
    return time < 1200;
  }
}
