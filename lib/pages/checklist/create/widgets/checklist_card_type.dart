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
import 'package:super_green_app/pages/feed_entries/common/feed_entry_assets.dart';
import 'package:tuple/tuple.dart';

class ChecklistCardType extends StatelessWidget {

  final String? cardType;
  final Function(String type) onChange;

  const ChecklistCardType({Key? key, required this.onChange, required this.cardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> choices = [
      FE_MEDIA,
      FE_MEASURE,
      FE_TRANSPLANT,
      FE_BENDING,
      FE_FIMMING,
      FE_TOPPING,
      FE_DEFOLIATION,
      FE_TIMELAPSE,
      FE_NUTRIENT_MIX,
      FE_WATER,
      FE_LIGHT,
      FE_VENTILATION,
      FE_SCHEDULE,
      FE_SCHEDULE_VEG,
      FE_SCHEDULE_BLOOM,
      FE_SCHEDULE_AUTO,
    ];
    return DropdownButton<String?>(
      hint: Text('Select card type'),
      value: cardType,
      onChanged: (String? value) {
        onChange(value == null ? '' : value);
      },
      items: choices.map<DropdownMenuItem<String>>((c) {
        return DropdownMenuItem<String>(
          value: c,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(FeedEntryIcons[c]!),
              ),
              Text(FeedEntryName[c]!),
            ],
          ),
        );
      }).toList(),
    );
  }
}
