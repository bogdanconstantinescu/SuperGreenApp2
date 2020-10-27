import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_green_app/main/main_navigator_bloc.dart';
import 'package:super_green_app/pages/settings/devices/edit_config/settings_device_bloc.dart';
import 'package:super_green_app/pages/settings/devices/upgrade/settings_upgrade_device_bloc.dart';
import 'package:super_green_app/widgets/appbar.dart';
import 'package:super_green_app/widgets/fullscreen.dart';
import 'package:super_green_app/widgets/fullscreen_loading.dart';
import 'package:super_green_app/widgets/section_title.dart';

class SettingsUpgradeDevicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsUpgradeDeviceBloc,
        SettingsUpgradeDeviceBlocState>(
      listener: (BuildContext context, SettingsUpgradeDeviceBlocState state) {
        if (state is SettingsUpgradeDeviceBlocStateUpgradeDone) {
          Timer(Duration(seconds: 3), () {
            BlocProvider.of<MainNavigatorBloc>(context)
                .add(MainNavigatorActionPop(param: true));
          });
        }
      },
      child: BlocBuilder<SettingsUpgradeDeviceBloc,
          SettingsUpgradeDeviceBlocState>(
        builder: (BuildContext context, SettingsUpgradeDeviceBlocState state) {
          Widget body;
          if (state is SettingsUpgradeDeviceBlocStateInit) {
            body = FullscreenLoading();
          } else if (state is SettingsUpgradeDeviceBlocStateLoaded) {
            body = renderLoaded(context, state);
          } else if (state is SettingsUpgradeDeviceBlocStateUpgrading) {
            body = renderUpgrading(context, state);
          } else if (state is SettingsUpgradeDeviceBlocStateUpgradeDone) {
            body = renderUpgradeDone(context, state);
          }
          return Scaffold(
              appBar: SGLAppBar(
                '🤖',
                fontSize: 40,
                backgroundColor: Color(0xff0b6ab3),
                titleColor: Colors.white,
                iconColor: Colors.white,
                hideBackButton: state is SettingsDeviceBlocStateDone,
              ),
              backgroundColor: Colors.white,
              body: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200), child: body));
        },
      ),
    );
  }

  Widget renderLoaded(
      BuildContext context, SettingsUpgradeDeviceBlocStateLoaded state) {
    if (!state.needsUpgrade) {
      return Fullscreen(
          title: 'You\'re up to date',
          child: Icon(Icons.check, color: Color(0xff3bb30b), size: 100));
    }
    return Column(children: <Widget>[
      Expanded(
          child: ListView(children: <Widget>[
        SectionTitle(
          title: 'Upgrade available',
          icon: 'assets/settings/icon_upgrade.svg',
          backgroundColor: Color(0xff0b6ab3),
          titleColor: Colors.white,
          elevation: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: ListTile(
            leading: SvgPicture.asset('assets/settings/icon_upgrade.svg'),
            trailing: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SvgPicture.asset('assets/settings/icon_go.svg'),
            ),
            title: Text('Upgrade controller'),
            subtitle: Text(
                'Tap to start the upgrade process. In some rare cases this could lead to the controller resetting to default, that can be fixed by removing and re-adding the controller to the app.'),
            onTap: () {
              BlocProvider.of<SettingsUpgradeDeviceBloc>(context)
                  .add(SettingsUpgradeDeviceBlocEventUpgrade());
            },
          ),
        ),
      ]))
    ]);
  }

  Widget renderUpgrading(
      BuildContext context, SettingsUpgradeDeviceBlocStateUpgrading state) {
    return FullscreenLoading(title: state.progressMessage);
  }

  Widget renderUpgradeDone(
      BuildContext context, SettingsUpgradeDeviceBlocStateUpgradeDone state) {
    String subtitle = 'Controller upgraded!';
    return Fullscreen(
        title: 'Done!',
        subtitle: subtitle,
        child: Icon(Icons.done, color: Color(0xff0bb354), size: 100));
  }
}
