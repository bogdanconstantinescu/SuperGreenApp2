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
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:super_green_app/l10n.dart';
import 'package:super_green_app/pages/feeds/home/common/app_bar/widgets/app_bar_action.dart';
import 'package:super_green_app/pages/feeds/home/common/app_bar/common/metrics/app_bar_metrics_page.dart';
import 'package:super_green_app/pages/feeds/home/common/app_bar/widgets/app_bar_tab.dart';
import 'package:super_green_app/pages/feeds/home/plant_feeds/local/app_bar/status/plant_quick_view_bloc.dart';
import 'package:super_green_app/widgets/fullscreen_loading.dart';

class PlantQuickViewPage extends StatelessWidget {
  static String get plantQuickViewPageLoadingPlantData {
    return Intl.message(
      'Loading plant data',
      name: 'productsPageLoadingPlantData',
      desc: 'Products page loading plant data',
      locale: SGLLocalizations.current?.localeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlantQuickViewBloc, PlantQuickViewBlocState>(
      listener: (BuildContext context, PlantQuickViewBlocState state) {
        if (state is PlantQuickViewBlocStateLoaded) {}
      },
      child: BlocBuilder<PlantQuickViewBloc, PlantQuickViewBlocState>(
          bloc: BlocProvider.of<PlantQuickViewBloc>(context),
          builder: (BuildContext context, PlantQuickViewBlocState state) {
            if (state is PlantQuickViewBlocStateInit) {
              return AppBarTab(child: _renderLoading(context, state));
            }
            return AppBarTab(child: _renderLoaded(context, state as PlantQuickViewBlocStateLoaded));
          }),
    );
  }

  Widget _renderLoading(BuildContext context, PlantQuickViewBlocStateInit state) {
    return FullscreenLoading(
      title: PlantQuickViewPage.plantQuickViewPageLoadingPlantData,
    );
  }

  Widget _renderLoaded(BuildContext context, PlantQuickViewBlocStateLoaded state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _renderStatus(context, state),
        _renderActions(context, state),
      ],
    );
  }

  Widget _renderStatus(BuildContext context, PlantQuickViewBlocStateLoaded state) {
    return Column(
      children: [
        Text('Quick view', style: TextStyle(color: Color(0xFF494949), fontWeight: FontWeight.bold, fontSize: 25)),
        Container(height: 2, color: Color(0xFF777777)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('01/02/2022', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text('Blooming - 3rd week', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        AppBarBoxMetricsPage(),
      ],
    );
  }

  Widget _renderActions(BuildContext context, PlantQuickViewBlocStateLoaded state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: AppBarAction(
              icon: 'assets/feed_card/icon_watering.svg',
              color: Color(0xFF506EBA),
              title: 'LAST WATERING',
              titleIcon: Icon(Icons.warning, size: 20, color: Colors.red),
              body: Text(state.watering != null ? state.watering!.date.toString() : 'No watering yet'),
              action: InkWell(
                onTap: () {},
                child: SvgPicture.asset('assets/app_bar/icon_watering.svg'),
              )),
        ),
        AppBarAction(
            icon: 'assets/feed_card/icon_media.svg',
            color: Color(0xFF617682),
            title: 'LAST GROWLOG',
            body: Text(state.media != null ? state.media!.date.toString() : 'No grow log yet'),
            action: InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/app_bar/icon_growlog.svg'),
            )),
      ],
    );
  }
}
