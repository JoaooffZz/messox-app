import 'package:flutter/material.dart';
import 'package:messox_app/data/models/system/settings.dart';

import '../../../core/language/data.dart';
import '../../../data/models/system/server.dart';
import '../../../data/models/system/user.dart';
import '../../../data/services/get/box_system.dart';

class SystemCacheProvider with ChangeNotifier {
  Settings? settings;
  User? user;
  Server? server;
  DataLanguage? dataLanguage;

  Future<void> run() async{
    settings = await GetBoxSystem.getSettings();

    if(settings == null) {
      settings = Settings.New();
      upLanguage(settings!.language);
      return;
    }
    upLanguage(settings!.language);

    server = await GetBoxSystem.getServer();
    if(server == null) return;

    user = await GetBoxSystem.getUser();
  }

  void upServer(Server s) => server = s;

  void upUser(User u) => user = u; 

  void upTheme(String t) {
    settings!.theme = t;
    notifyListeners();
  }

  Future<void> upLanguage(String l) async{
    settings!.language = l;
    dataLanguage = await DataLanguage.build(l);
    notifyListeners();
  }
}