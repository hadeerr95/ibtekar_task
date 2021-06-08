import 'package:hive/hive.dart';
import 'package:ibtekar_task/storage/storage_keys.dart';
import 'package:path_provider/path_provider.dart';

class HiveStorage {
  static HiveStorage? singleton;
  static Box? box;
  factory HiveStorage() {
    singleton = singleton ?? HiveStorage._internal();
    return singleton!;
  }

  HiveStorage._internal();

  putInBox(String key, dynamic value) {
    box?.put(key, value);
  }

  createHive() async {
    var directory = await getTemporaryDirectory();
    Hive.init(directory.path);
    box = await Hive.openBox(StorageKeys.BOX_NAME);
  }

  getFromBox(String key) {
    return box?.get(key, defaultValue: null);
  }

  removeFromBox(String key) {
    box?.delete(key);
  }

  deleteBox() {
    Hive.deleteBoxFromDisk(StorageKeys.BOX_NAME);
  }

  deleteKeys(Iterable<dynamic>? keys) {
    box?.deleteAll(keys!);
  }
}
