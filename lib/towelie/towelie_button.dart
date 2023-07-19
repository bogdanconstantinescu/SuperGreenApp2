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

import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:super_green_app/data/api/backend/feeds/feed_helper.dart';
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:super_green_app/towelie/towelie_bloc.dart';

abstract class TowelieButton {
  String get id;

  static Map<String, dynamic> createButton(String id, Map<String, dynamic> params) {
    params['id'] = id;
    return params;
  }

  Stream<TowelieBlocState> buttonPressed(TowelieBlocEventButtonPressed event);

  Future selectButtons(FeedEntry feedEntry, {String? selectedButtonID, bool Function(dynamic)? selector}) async {
    if (selectedButtonID != null) {
      selector = (b) => b['id'] == selectedButtonID;
    }
    final Map<String, dynamic> params = JsonDecoder().convert(feedEntry.params);
    final Map<String, dynamic> button = (params['buttons'] as List).singleWhere(selector!);
    params['selectedButton'] = button;
    await FeedEntryHelper.updateFeedEntry(FeedEntriesCompanion(
        id: Value(feedEntry.id), params: Value(JsonEncoder().convert(params)), synced: Value(false)));
  }
}
