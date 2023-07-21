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
import 'package:tuple/tuple.dart';

class ChecklistCardType extends StatelessWidget {

  final String? cardType;
  final Function(String type) onChange;

  const ChecklistCardType({Key? key, required this.onChange, required this.cardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tuple3<String, String, String>> choices = [
      Tuple3('FE_MEDIA', 'assets/feed_card/icon_media.svg', 'Media'),
    ];
    return DropdownButton<String?>(
      value: cardType,
      onChanged: (String? value) {
        onChange(value == null ? '' : value);
      },
      items: choices.map<DropdownMenuItem<String>>((c) {
        return DropdownMenuItem<String>(
          value: c.item1,
          child: Row(
            children: [
              SvgPicture.asset(c.item2),
              Text(c.item3),
            ],
          ),
        );
      }).toList(),
    );
  }
}
