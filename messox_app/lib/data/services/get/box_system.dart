

import 'package:hive/hive.dart';
import 'package:messox_app/data/models/system/settings.dart';

import '../../../core/constants/boxes/system.dart';
import '../../models/system/server.dart';
import '../../models/system/user.dart';

Future<Box<dynamic>> _initBox() async {
  if (!Hive.isBoxOpen(ConstsBoxSystem.boxName)) {
    await Hive.openBox(ConstsBoxSystem.boxName);
  }
  return Hive.box(ConstsBoxSystem.boxName);
}

class GetBoxSystem {
  static Future<Settings?> getSettings() async {
    Settings? settings;
    final box = await _initBox();
    final json = box.get(ConstsBoxSystem.tableSettings);
    if (json != null) {
      settings = Settings.fromJson(json);
    }
    return settings;
  }
  
  static Future<User?> getUser() async {
    User? user;
    final box = await _initBox();
    final json = box.get(ConstsBoxSystem.tableSettings);
    if (json != null) {
      user = User.fromJson(json);
    }
    return user;
  }

  static Future<Server?> getServer() async {
    Server? server;
    final box = await _initBox();
    final json = box.get(ConstsBoxSystem.tableSettings);
    if (json != null) {
      server = Server.fromJson(json);
    }
    return server;
  }
}