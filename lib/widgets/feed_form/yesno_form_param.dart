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

import 'package:flutter/material.dart';
import 'package:super_green_app/widgets/feed_form/feed_form_button.dart';
import 'package:super_green_app/widgets/feed_form/feed_form_param_layout.dart';

class YesNoFormParam extends StatelessWidget {
  final String title;
  final String icon;
  final bool? yes;
  final Color? titleBackgroundColor;
  final void Function(bool?) onPressed;
  final Widget? child;

  const YesNoFormParam(
      {required this.icon,
      required this.title,
      required this.yes,
      required this.onPressed,
      this.titleBackgroundColor,
      this.child});

  @override
  Widget build(BuildContext context) {
    return FeedFormParamLayout(
      icon: icon,
      title: title,
      titleBackgroundColor: titleBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FeedFormButton(
                    title: 'YES',
                    icon: Icon(Icons.check, color: yes == true ? Color(0xff3bb30b) : Colors.white),
                    border: yes == true,
                    onPressed: () {
                      this.onPressed(yes == true ? null : true);
                    },
                    textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                FeedFormButton(
                    title: 'NO',
                    icon: Icon(Icons.close, color: yes == false ? Colors.red : Colors.white),
                    border: yes == false,
                    onPressed: () {
                      this.onPressed(yes == false ? null : false);
                    },
                    textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ],
            ),
            this.child ?? Container(),
          ],
        ),
      ),
    );
  }
}
