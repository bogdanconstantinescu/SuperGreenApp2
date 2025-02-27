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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:super_green_app/l10n.dart';
import 'package:super_green_app/pages/feeds/feed/bloc/state/feed_entry_state.dart';
import 'package:super_green_app/pages/feeds/feed/bloc/state/feed_state.dart';
import 'package:super_green_app/widgets/feed_card/feed_card.dart';
import 'package:super_green_app/widgets/feed_card/feed_card_date.dart';
import 'package:super_green_app/widgets/feed_card/feed_card_title.dart';
import 'package:super_green_app/widgets/fullscreen.dart';

class FeedUnknownCardPage extends StatelessWidget {
  static String get feedUnknownCardPageTitle {
    return Intl.message(
      'Unknown card',
      name: 'feedUnknownCardPageTitle',
      desc: 'Feed unknown card title',
      locale: SGLLocalizations.current?.localeName,
    );
  }

  static String get feedUnknownCardPageUpgradeApp {
    return Intl.message(
      'Upgrade your app',
      name: 'feedUnknownCardPageUpgradeApp',
      desc: 'Feed unknown card upgrade app',
      locale: SGLLocalizations.current?.localeName,
    );
  }

  final Animation<double> animation;
  final FeedState feedState;
  final FeedEntryState state;

  const FeedUnknownCardPage(this.animation, this.feedState, this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FeedCard(
      animation: animation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FeedCardTitle('assets/feed_card/icon_unknown.svg', FeedUnknownCardPage.feedUnknownCardPageTitle, state.synced,
              showSyncStatus: !state.isRemoteState, showControls: !state.isRemoteState),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FeedCardDate(state, feedState),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            child: Fullscreen(
              title: FeedUnknownCardPage.feedUnknownCardPageTitle,
              subtitle: FeedUnknownCardPage.feedUnknownCardPageUpgradeApp,
              child: SvgPicture.asset('assets/feed_card/icon_unknown.svg', height: 70),
            ),
          ),
        ],
      ),
    );
  }
}
