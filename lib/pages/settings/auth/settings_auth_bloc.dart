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

import 'dart:io';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:super_green_app/misc/bloc.dart';
import 'package:image/image.dart';
import 'package:super_green_app/data/api/backend/backend_api.dart';
import 'package:super_green_app/data/api/backend/users/users_api.dart';
import 'package:super_green_app/data/kv/app_db.dart';
import 'package:super_green_app/main/main_navigator_bloc.dart';
import 'package:super_green_app/notifications/remote_notifications.dart';

abstract class SettingsAuthBlocEvent extends Equatable {}

class SettingsAuthBlocEventInit extends SettingsAuthBlocEvent {
  final int rand = Random().nextInt(1 << 32);
  
  @override
  List<Object> get props => [rand];
}

class SettingsAuthBlocEventSetSyncedOverGSM extends SettingsAuthBlocEvent {
  final bool syncOverGSM;

  SettingsAuthBlocEventSetSyncedOverGSM(this.syncOverGSM);

  @override
  List<Object> get props => [syncOverGSM];
}

class SettingsAuthBlocEventLogout extends SettingsAuthBlocEvent {
  @override
  List<Object> get props => [];
}

class SettingsAuthBlocEventUpdatePic extends SettingsAuthBlocEvent {
  final File file;

  SettingsAuthBlocEventUpdatePic(this.file);

  @override
  List<Object> get props => [file];
}

abstract class SettingsAuthBlocState extends Equatable {}

class SettingsAuthBlocStateInit extends SettingsAuthBlocState {
  @override
  List<Object> get props => [];
}

class SettingsAuthBlocStateLoading extends SettingsAuthBlocState {
  @override
  List<Object> get props => [];
}

class SettingsAuthBlocStateLoaded extends SettingsAuthBlocState {
  final bool isAuth;
  final bool notificationEnabled;
  final bool syncOverGSM;
  final User? user;

  SettingsAuthBlocStateLoaded(this.isAuth, this.notificationEnabled, this.syncOverGSM, this.user);

  @override
  List<Object?> get props => [isAuth, notificationEnabled, syncOverGSM, user];
}

class SettingsAuthBlocStateDone extends SettingsAuthBlocState {
  @override
  List<Object> get props => [];
}

class SettingsAuthBlocStateError extends SettingsAuthBlocState {
  final String message;

  SettingsAuthBlocStateError(this.message);

  @override
  List<Object> get props => [message];
}

class SettingsAuthBloc extends LegacyBloc<SettingsAuthBlocEvent, SettingsAuthBlocState> {
  //ignore: unused_field
  final MainNavigateToSettingsAuth args;
  late bool _isAuth;

  SettingsAuthBloc(this.args) : super(SettingsAuthBlocStateInit()) {
    add(SettingsAuthBlocEventInit());
  }

  @override
  Stream<SettingsAuthBlocState> mapEventToState(SettingsAuthBlocEvent event) async* {
    if (event is SettingsAuthBlocEventInit) {
      yield SettingsAuthBlocStateLoading();
      /*yield SettingsAuthBlocStateLoaded(
          _isAuth, AppDB().getAppData().syncOverGSM, null);*/
      User? user;
      bool notificationEnabled = false;
      _isAuth = BackendAPI().usersAPI.loggedIn;
      if (_isAuth) {
        user = await BackendAPI().usersAPI.me();
        notificationEnabled = await RemoteNotifications.checkPermissions();
      }
      yield SettingsAuthBlocStateLoaded(_isAuth, notificationEnabled, AppDB().getAppData().syncOverGSM, user);
    } else if (event is SettingsAuthBlocEventSetSyncedOverGSM) {
      AppDB().setSynceOverGSM(event.syncOverGSM);
    } else if (event is SettingsAuthBlocEventLogout) {
      AppDB().setJWT(null);
      yield SettingsAuthBlocStateDone();
    } else if (event is SettingsAuthBlocEventUpdatePic) {
      yield SettingsAuthBlocStateLoading();
      String ext = event.file.path.split('.').last.toLowerCase();
      if (!['jpg', 'jpeg', 'png'].contains(ext)) {
        yield SettingsAuthBlocStateError("Avatar can only be a picture.");
        await Future.delayed(Duration(milliseconds: 2000));
        add(SettingsAuthBlocEventInit());
        return;
      }

      Image? image = decodeImage(await event.file.readAsBytes());
      Image thumbnail = copyResize(image!,
          height: image.height > image.width ? 300 : null, width: image.width >= image.height ? 300 : null);
      File tmpDest = File('${AppDB().tmpPath}/avatar.$ext');
      await tmpDest.writeAsBytes(encodeJpg(thumbnail, quality: 50));

      await BackendAPI().usersAPI.uploadProfilePic(tmpDest);
      add(SettingsAuthBlocEventInit());
    }
  }
}
