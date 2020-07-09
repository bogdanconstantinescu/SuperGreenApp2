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
import 'package:super_green_app/pages/feeds/plant_feeds/common/plant_infos/widgets/plant_infos_form.dart';
import 'package:super_green_app/pages/feeds/plant_feeds/common/plant_infos/widgets/plant_infos_input.dart';

class PlantInfosPlantType extends StatefulWidget {
  final String plantType;

  final Function onCancel;
  final Function onSubmit;

  PlantInfosPlantType(
      {@required this.plantType,
      @required this.onCancel,
      @required this.onSubmit});

  @override
  _PlantInfosPlantTypeState createState() => _PlantInfosPlantTypeState();
}

class _PlantInfosPlantTypeState extends State<PlantInfosPlantType> {
  final TextEditingController plantTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PlantInfosForm(
      title: 'Plant type',
      icon: 'icon_plant_type.svg',
      onCancel: widget.onCancel,
      onSubmit: widget.onSubmit,
      child: Column(
        children: <Widget>[
          PlantInfosInput(
              controller: plantTypeController,
              initialValue: widget.plantType,
              labelText: 'Plant type',
              hintText: 'Ex: Photo/Auto'),
        ],
      ),
    );
  }
}
