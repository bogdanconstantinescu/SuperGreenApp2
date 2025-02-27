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
import 'package:super_green_app/misc/bloc.dart';

abstract class NotificationRequestBlocEvent extends Equatable {}

class NotificationRequestBlocEventInit extends NotificationRequestBlocEvent {
  @override
  List<Object> get props => [];
}

class NotificationRequestBlocEventDone extends NotificationRequestBlocEvent {
  @override
  List<Object> get props => [];
}

abstract class NotificationRequestBlocState extends Equatable {}

class NotificationRequestBlocStateInit extends NotificationRequestBlocState {
  @override
  List<Object> get props => [];
}

class NotificationRequestBlocStateLoaded extends NotificationRequestBlocState {
  @override
  List<Object> get props => [];
}

class NotificationRequestBloc extends LegacyBloc<NotificationRequestBlocEvent, NotificationRequestBlocState> {
  final Function onClose;

  NotificationRequestBloc({required this.onClose}) : super(NotificationRequestBlocStateInit()) {
    add(NotificationRequestBlocEventInit());
  }

  @override
  Stream<NotificationRequestBlocState> mapEventToState(NotificationRequestBlocEvent event) async* {
    if (event is NotificationRequestBlocEventInit) {
      yield NotificationRequestBlocStateLoaded();
    } else if (event is NotificationRequestBlocEventDone) {
      onClose();
    }
  }
}
