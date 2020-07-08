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

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_green_app/pages/feeds/plant_feeds/common/params/plant_infos_settings.dart';

class PlantInfos extends Equatable {
  final String name;
  final String filePath;
  final String thumbnailPath;
  final PlantInfosSettings settings;

  PlantInfos(this.name, this.filePath, this.thumbnailPath, this.settings);

  @override
  List<Object> get props => [name, filePath, thumbnailPath, settings];

  PlantInfos copyWith(
          {String name,
          String filePath,
          String thumbnailPath,
          PlantInfosSettings settings}) =>
      PlantInfos(
        name ?? this.name,
        filePath ?? this.filePath,
        thumbnailPath ?? this.thumbnailPath,
        settings ?? this.settings,
      );
}

abstract class PlantInfosEvent extends Equatable {}

class PlantInfosEventLoad extends PlantInfosEvent {
  @override
  List<Object> get props => [];
}

class PlantInfosEventLoaded extends PlantInfosEvent {
  final PlantInfos plantInfos;

  PlantInfosEventLoaded(this.plantInfos);

  @override
  List<Object> get props => [plantInfos];
}

class PlantInfosEventUpdate extends PlantInfosEvent {
  final PlantInfosSettings settings;

  PlantInfosEventUpdate(this.settings);

  @override
  List<Object> get props => [settings];
}

abstract class PlantInfosState extends Equatable {}

class PlantInfosStateLoading extends PlantInfosState {
  @override
  List<Object> get props => [];
}

class PlantInfosStateLoaded extends PlantInfosState {
  final PlantInfos plantInfos;

  PlantInfosStateLoaded(this.plantInfos);

  @override
  List<Object> get props => [plantInfos];
}

abstract class PlantInfosBloc extends Bloc<PlantInfosEvent, PlantInfosState> {
  PlantInfos plantInfos;

  PlantInfosBloc() {
    add(PlantInfosEventLoad());
  }

  @override
  PlantInfosState get initialState => PlantInfosStateLoading();

  @override
  Stream<PlantInfosState> mapEventToState(PlantInfosEvent event) async* {
    if (event is PlantInfosEventLoad) {
      yield* loadPlant();
    } else if (event is PlantInfosEventLoaded) {
      yield PlantInfosStateLoaded(event.plantInfos);
    } else if (event is PlantInfosEventUpdate) {
      yield* updatePlant(event.settings);
    }
  }

  Stream<PlantInfosState> loadPlant();
  Stream<PlantInfosState> updatePlant(PlantInfosSettings settings);

  void plantInfosLoaded(PlantInfos plantInfos) {
    this.plantInfos = plantInfos;
    add(PlantInfosEventLoaded(this.plantInfos));
  }
}
