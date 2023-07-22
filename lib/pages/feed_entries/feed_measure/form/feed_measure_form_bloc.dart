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

import 'package:super_green_app/misc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:drift/drift.dart';
import 'package:super_green_app/data/api/backend/feeds/feed_helper.dart';
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:super_green_app/main/main_navigator_bloc.dart';
import 'package:super_green_app/pages/feed_entries/entry_params/feed_measure.dart';

abstract class FeedMeasureFormBlocEvent extends Equatable {}

class FeedMeasureFormBlocEventInit extends FeedMeasureFormBlocEvent {
  FeedMeasureFormBlocEventInit();

  @override
  List<Object> get props => [];
}

class FeedMeasureFormBlocEventCreate extends FeedMeasureFormBlocEvent {
  final String message;
  final FeedMedia? previous;
  final FeedMediasCompanion? current;

  FeedMeasureFormBlocEventCreate(this.message, this.previous, this.current);

  @override
  List<Object?> get props => [message, previous, current];
}

abstract class FeedMeasureFormBlocState extends Equatable {}

class FeedMeasureFormBlocStateInit extends FeedMeasureFormBlocState {
  FeedMeasureFormBlocStateInit();

  @override
  List<Object> get props => [];
}

class FeedMeasureFormBlocStateLoading extends FeedMeasureFormBlocState {
  FeedMeasureFormBlocStateLoading();

  @override
  List<Object> get props => [];
}

class FeedMeasureFormBlocStateLoaded extends FeedMeasureFormBlocState {
  final List<FeedMedia> measures;

  FeedMeasureFormBlocStateLoaded(this.measures);

  @override
  List<Object> get props => [];
}

class FeedMeasureFormBlocStateDone extends FeedMeasureFormBlocState {
  final Plant plant;
  final FeedEntry feedEntry;

  FeedMeasureFormBlocStateDone(this.plant, this.feedEntry);

  @override
  List<Object> get props => [];
}

class FeedMeasureFormBloc extends LegacyBloc<FeedMeasureFormBlocEvent, FeedMeasureFormBlocState> {
  final MainNavigateToFeedMeasureFormEvent args;

  FeedMeasureFormBloc(this.args) : super(FeedMeasureFormBlocStateInit()) {
    add(FeedMeasureFormBlocEventInit());
  }

  @override
  Stream<FeedMeasureFormBlocState> mapEventToState(FeedMeasureFormBlocEvent event) async* {
    if (event is FeedMeasureFormBlocEventInit) {
      final db = RelDB.get();
      List<FeedMedia> measures = await db.feedsDAO.getFeedMediasWithType('FE_MEASURE', feedID: args.plant.feed);
      yield FeedMeasureFormBlocStateLoaded(measures);
    } else if (event is FeedMeasureFormBlocEventCreate) {
      yield FeedMeasureFormBlocStateLoading();
      final db = RelDB.get();
      FeedEntry? previousEntry;
      if (event.previous != null) {
        previousEntry = await RelDB.get().feedsDAO.getFeedEntry(event.previous!.feedEntry);
      }
      int feedEntryID = await FeedEntryHelper.addFeedEntry(FeedEntriesCompanion.insert(
        type: 'FE_MEASURE',
        feed: args.plant.feed,
        date: DateTime.now(),
        params: Value(FeedMeasureParams(
                event.message,
                event.previous != null ? DateTime.now().difference(previousEntry!.date).inSeconds : null,
                event.previous != null ? event.previous!.id : null)
            .toJSON()),
      ));
      await db.feedsDAO
          .addFeedMedia(event.current!.copyWith(feed: Value(args.plant.feed), feedEntry: Value(feedEntryID)));
      FeedEntry feedEntry = await db.feedsDAO.getFeedEntry(feedEntryID);
      yield FeedMeasureFormBlocStateDone(args.plant, feedEntry);
    }
  }
}
