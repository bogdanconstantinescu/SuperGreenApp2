import 'dart:async';
import 'dart:math';

import 'package:basic_utils/basic_utils.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:super_green_app/main/main_navigator_bloc.dart';
import 'package:super_green_app/pages/feeds/box_feed/box_drawer_bloc.dart';
import 'package:super_green_app/pages/feeds/box_feed/box_feed_bloc.dart';
import 'package:super_green_app/pages/feeds/feed/feed_bloc.dart';
import 'package:super_green_app/pages/feeds/feed/feed_page.dart';
import 'package:super_green_app/pages/home/home_navigator_bloc.dart';

class BoxFeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxFeedBloc, BoxFeedBlocState>(
      bloc: BlocProvider.of<BoxFeedBloc>(context),
      builder: (BuildContext context, BoxFeedBlocState state) {
        return Scaffold(
            drawer: Drawer(child: this._drawerContent(context)),
            body: _renderFeed(context, state),
            floatingActionButton: state is BoxFeedBlocStateBox
                ? _renderSpeedDial(context, state)
                : null);
      },
    );
  }

  SpeedDial _renderSpeedDial(BuildContext context, BoxFeedBlocStateBox state) {
    return SpeedDial(
      marginBottom: 10,
      animationSpeed: 50,
      curve: Curves.bounceIn,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      overlayOpacity: 0.8,
      children: [
        _renderSpeedDialChild(
            'Video/pic note',
            'assets/feed_card/icon_media.svg',
            _onSpeedDialSelected(
                context,
                ({pushAsReplacement = false}) =>
                    MainNavigateToFeedMediaFormEvent(state.box,
                        pushAsReplacement: pushAsReplacement))),
        _renderSpeedDialChild(
            'Watering',
            'assets/feed_card/icon_watering.svg',
            _onSpeedDialSelected(
                context,
                ({pushAsReplacement = false}) =>
                    MainNavigateToFeedWaterFormEvent(state.box,
                        pushAsReplacement: pushAsReplacement))),
        _renderSpeedDialChild(
            'Stretch control',
            'assets/feed_card/icon_dimming.svg',
            _onSpeedDialSelected(
                context,
                ({pushAsReplacement = false}) =>
                    MainNavigateToFeedLightFormEvent(state.box,
                        pushAsReplacement: pushAsReplacement))),
        _renderSpeedDialChild(
            'Ventilation',
            'assets/feed_card/icon_blower.svg',
            _onSpeedDialSelected(
                context,
                ({pushAsReplacement = false}) =>
                    MainNavigateToFeedVentilationFormEvent(state.box,
                        pushAsReplacement: pushAsReplacement))),
        _renderSpeedDialChild(
            'Defoliation',
            'assets/feed_card/icon_defoliation.svg',
            _onSpeedDialSelected(
                context,
                ({pushAsReplacement = false}) =>
                    MainNavigateToFeedDefoliationFormEvent(state.box,
                        pushAsReplacement: pushAsReplacement))),
        _renderSpeedDialChild(
            'Topping',
            'assets/feed_card/icon_topping.svg',
            _onSpeedDialSelected(
                context,
                ({pushAsReplacement = false}) =>
                    MainNavigateToFeedToppingFormEvent(state.box,
                        pushAsReplacement: pushAsReplacement))),
        _renderSpeedDialChild(
            'Veg/Bloom',
            'assets/feed_card/icon_schedule.svg',
            _onSpeedDialSelected(
                context,
                ({pushAsReplacement = false}) =>
                    MainNavigateToFeedScheduleFormEvent(state.box,
                        pushAsReplacement: pushAsReplacement))),
      ],
    );
  }

  SpeedDialChild _renderSpeedDialChild(
      String label, String icon, void Function() navigateTo) {
    return SpeedDialChild(
      child: SvgPicture.asset(icon),
      label: label,
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      onTap: navigateTo,
    );
  }

  void Function() _onSpeedDialSelected(BuildContext context,
      MainNavigatorEvent Function({bool pushAsReplacement}) navigatorEvent) {
    return () => BlocProvider.of<MainNavigatorBloc>(context)
        .add(MainNavigateToTipEvent(navigatorEvent(pushAsReplacement: true)));
  }

  Widget _renderFeed(BuildContext context, BoxFeedBlocState state) {
    if (state is BoxFeedBlocStateBox) {
      return BlocProvider(
        create: (context) => FeedBloc(state.box.feed),
        child: FeedPage(
          color: Colors.cyan,
          appBar: _renderAppBar(context, state),
        ),
      );
    } else if (state is BoxFeedBlocStateNoBox) {
      return Text('No box yet');
    }
    return Text(
      'Box loading..',
    );
  }

  Widget _drawerContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: 120,
          child: DrawerHeader(
              child: Row(children: <Widget>[
            SizedBox(
              width: 40,
              height: 40,
              child: SvgPicture.asset("assets/super_green_lab_vertical.svg"),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('Box list',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ])),
        ),
        Expanded(
          child: _boxList(context),
        ),
        Divider(),
        Container(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.add_circle),
                        title: Text('Add box'),
                        onTap: () => _onAddBox(context)),
                  ],
                ))))
      ],
    );
  }

  Widget _boxList(BuildContext context) {
    return BlocBuilder<BoxDrawerBloc, BoxDrawerBlocState>(
      bloc: BlocProvider.of<BoxDrawerBloc>(context),
      condition: (previousState, state) =>
          state is BoxDrawerBlocStateLoadingBoxList ||
          state is BoxDrawerBlocStateBoxListUpdated,
      builder: (BuildContext context, BoxDrawerBlocState state) {
        List<Box> boxes = List();
        if (state is BoxDrawerBlocStateBoxListUpdated) {
          boxes = state.boxes;
        }
        return ListView(
          children: boxes
              .map((b) => ListTile(
                    onTap: () => _selectBox(context, b),
                    title: Text('${b.name}'),
                  ))
              .toList(),
        );
      },
    );
  }

  void _selectBox(BuildContext context, Box box) {
    //ignore: close_sinks
    HomeNavigatorBloc navigatorBloc =
        BlocProvider.of<HomeNavigatorBloc>(context);
    Navigator.pop(context);
    Timer(Duration(milliseconds: 250),
        () => navigatorBloc.add(HomeNavigateToBoxFeedEvent(box)));
  }

  void _onAddBox(BuildContext context) {
    BlocProvider.of<MainNavigatorBloc>(context)
        .add(MainNavigateToNewBoxInfosEvent());
  }

  Widget _renderAppBar(BuildContext context, BoxFeedBlocStateBox state) {
    String name = 'SuperGreenLab';
    if (state is BoxFeedBlocStateBox) {
      name = StringUtils.capitalize(state.box.name);
    }
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 64.0, top: 12.0),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: NumericComboChart(_createSampleData(),
                  animate: true,
                  defaultRenderer: LineRendererConfig(),
                  customSeriesRenderers: [
                    PointRendererConfig(customRendererId: 'customPoint')
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  List<Series<LinearSales, int>> _createSampleData() {
    final desktopSalesData = List.generate(50, (index) => LinearSales(index, (cos(index / 100) * 20).toInt() + Random().nextInt(7) + 20));

    final tableSalesData = List.generate(50, (index) => LinearSales(index, (sin(index / 100) * 5).toInt() + Random().nextInt(3) + 20));

    return [
      Series<LinearSales, int>(
        id: 'Temperature',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      Series<LinearSales, int>(
        id: 'Humidity',
        colorFn: (_, __) => MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
