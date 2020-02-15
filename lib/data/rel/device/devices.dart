
import 'package:moor/moor.dart';
import 'package:super_green_app/data/rel/rel_db.dart';

part 'devices.g.dart';

class Devices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get identifier => text().withLength(min: 1, max: 16)();
  TextColumn get name => text().withLength(min: 1, max: 24)();
  TextColumn get config => text()();
  TextColumn get ip => text().withLength(min: 7, max: 15)();
  TextColumn get mdns => text().withLength(min: 1, max: 64)();
}

class Modules extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get device => integer()();
  TextColumn get name => text().withLength(min: 1, max: 24)();
  BoolColumn get isArray => boolean()();
  IntColumn get arrayLen => integer()();
}

const STRING_TYPE = 0;
const INTEGER_TYPE = 1;

class Params extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get device => integer()();
  IntColumn get module => integer()();
  TextColumn get key => text().withLength(min: 1, max: 30)();
  IntColumn get type => integer()();
  TextColumn get svalue => text().nullable().withLength(min: 0, max: 64)();
  IntColumn get ivalue => integer().nullable()();
}

@UseDao(tables: [Devices, Modules, Params])
class DevicesDAO extends DatabaseAccessor<RelDB> with _$DevicesDAOMixin {

  DevicesDAO(RelDB db) : super(db);

  Future<int> addDevice(DevicesCompanion device) {
    return into(devices).insert(device);
  }

  Future<Device> getDevice(int id) {
    return (select(devices)..where((d) => d.id.equals(id))).getSingle();
  }

  Future<Device> getDeviceByIdentifier(String identifier) {
    return (select(devices)..where((d) => d.identifier.equals(identifier))).getSingle();
  }

  Future<List<Device>> getDevices() {
    return select(devices).get();
  }

  Stream<List<Device>> watchDevices() {
    return select(devices).watch();
  }

  Future updateDevice(device) async {
    await update(devices).replace(device);
  }

  Future<int> addModule(ModulesCompanion module) {
    return into(modules).insert(module);
  }

  Future<Module> getModule(int deviceID, String name) {
    return (select(modules)
          ..where((m) => m.device.equals(deviceID) & m.name.equals(name)))
        .getSingle();
  }

  Future<int> addParam(ParamsCompanion param) {
    return into(params).insert(param);
  }

  SimpleSelectStatement<Params, Param> _getParam(int deviceID, String key) {
    return (select(params)
      ..where((p) => p.device.equals(deviceID) & p.key.equals(key)));
  }

  Future<Param> getParam(int deviceID, String key) {
    return _getParam(deviceID, key).getSingle();
  }

  Stream<Param> watchParam(int deviceID, String key) {
    return _getParam(deviceID, key).watchSingle();
  }

  Future updateParam(Param param) {
    return update(params).replace(param);
  }
}
