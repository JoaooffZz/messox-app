import 'package:hive/hive.dart';

import '../../../core/constants/boxes/system.dart';
import '../../models/system/server.dart';
import '../../models/system/settings.dart';
import '../../models/system/user.dart';

Future<Box<dynamic>> _initBox() async {
  if (!Hive.isBoxOpen(ConstsBoxSystem.boxName)) {
    await Hive.openBox(ConstsBoxSystem.boxName);
  }
  return Hive.box(ConstsBoxSystem.boxName);
}

class PutBoxSystem {
  static final TableSettings tableSettings = TableSettings();
  static final TableUser tableUser = TableUser();
  static final TableServer tableServer = TableServer();
}

class TableSettings {
  Future<void> up(Settings settings) async {
    final box = await _initBox();
    await box.put(ConstsBoxSystem.tableSettings, settings.toJson());
  }

  Future<void> upTheme(String theme) async {
    final box = await _initBox();
    final settings = await _get(box);
    settings.theme = theme;
    await box.put(ConstsBoxSystem.tableSettings, settings.toJson());
  }

  Future<void> upLanguage(String language) async {
    final box = await _initBox();
    final settings = await _get(box);
    settings.language = language;
    await box.put(ConstsBoxSystem.tableSettings, settings.toJson());
  }

  Future<Settings> _get(Box<dynamic> box) async {
    final json = box.get(ConstsBoxSystem.tableSettings);
    return Settings.fromJson(json);
  }
}

class TableUser {
  Future<void> up(User user) async {
    final box = await _initBox();
    await box.put(ConstsBoxSystem.tableUser, user.toJson());
  }

  Future<void> upBio(String bio) async {
    final box = await _initBox();
    final user = await _get(box);
    user.bio = bio;
    await box.put(ConstsBoxSystem.tableUser, user.toJson());
  }

  Future<void> upProfile(String profile) async {
    final box = await _initBox();
    final user = await _get(box);
    user.profile = profile;
    await box.put(ConstsBoxSystem.tableUser, user.toJson());
  }

  Future<User> _get(Box<dynamic> box) async {
    final json = box.get(ConstsBoxSystem.tableUser);
    return User.fromJson(Map<String, dynamic>.from(json));
  }
}

class TableServer {
  Future<void> up(Server server) async {
    final box = await _initBox();
    await box.put(ConstsBoxSystem.tableServer, server.toJson());
  }
}
