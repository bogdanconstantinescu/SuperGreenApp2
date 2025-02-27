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

class GreenButton extends ElevatedButton {
  final double? fontSize;

  GreenButton({title, onPressed, color = 0xff3bb30b, this.fontSize})
      : super(
          style: ButtonStyle(
            backgroundColor: onPressed != null ? MaterialStateProperty.resolveWith((state) => Color(color)) : MaterialStateProperty.resolveWith((state) => Color(0xffababab)),
          ),
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: fontSize)),
          onPressed: onPressed,
        );
}
