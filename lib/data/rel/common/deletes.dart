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

import 'package:drift/drift.dart';
import 'package:super_green_app/data/rel/rel_db.dart';

part 'deletes.g.dart';

class Deletes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get serverID => text().withLength(min: 36, max: 36)();
  TextColumn get type => text().withLength(min: 1, max: 16)();

  static Map<String, dynamic> toMap(Delete delete) {
    return {
      'id': delete.serverID,
      'type': delete.type,
    };
  }
}

@DriftAccessor(tables: [
  Deletes,
])
class DeletesDAO extends DatabaseAccessor<RelDB> with _$DeletesDAOMixin {
  DeletesDAO(RelDB db) : super(db);

  Future<int> addDelete(DeletesCompanion delete) {
    return into(deletes).insert(delete);
  }

  Future<List<Delete>> getDeletes() {
    return select(deletes).get();
  }

  Future removeDeletes(List<Delete> dels) {
    return (delete(deletes)..where((d) => d.id.isIn(dels.map<int>((d) => d.id)))).go();
  }
}
