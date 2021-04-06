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
import 'package:super_green_app/data/api/backend/backend_api.dart';
import 'package:super_green_app/pages/explorer/models/plants.dart';
import 'package:super_green_app/pages/explorer/sections/followed/followed_bloc.dart';
import 'package:super_green_app/pages/explorer/sections/section/section_page.dart';

class FollowedPage extends SectionPage<FollowedBloc, PublicPlant> {
  Widget itemBuilder(BuildContext context, PublicPlant plant) {
    return Column(
      children: [
        Row(
          children: [
            Image.network(BackendAPI().feedsAPI.absoluteFileURL(plant.thumbnailPath)),
          ],
        )
      ],
    );
  }
}
