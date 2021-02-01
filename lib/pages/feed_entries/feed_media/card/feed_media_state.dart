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

import 'package:super_green_app/pages/feed_entries/common/media_state.dart';
import 'package:super_green_app/pages/feeds/feed/bloc/state/feed_entry_social_state.dart';
import 'package:super_green_app/pages/feeds/feed/bloc/state/feed_entry_state.dart';

class FeedMediaState extends FeedEntryStateLoaded {
  final List<MediaState> medias;

  FeedMediaState(
    FeedEntryState from, {
    this.medias,
    FeedEntrySocialState socialState,
    bool isRemoteState,
    String shareLink,
  }) : super.copy(
          from,
          socialState: socialState ?? from.socialState,
          isRemoteState: isRemoteState ?? from.isRemoteState,
          shareLink: shareLink ?? from.shareLink,
        );

  @override
  List<Object> get props => [...super.props, medias];

  FeedEntryState copyWith({
    FeedEntrySocialState socialState,
    String shareLink,
  }) {
    return FeedMediaState(
      this,
      medias: this.medias,
      socialState: socialState ?? this.socialState,
      shareLink: shareLink ?? this.shareLink,
    );
  }
}
