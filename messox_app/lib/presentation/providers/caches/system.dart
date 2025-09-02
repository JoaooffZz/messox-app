import 'package:flutter/widgets.dart';
import 'package:messox_app/data/models/system/settings.dart';

import '../../../core/language/data.dart';
import '../../../core/theme/data.dart';
import '../../../data/models/system/server.dart';
import '../../../data/models/system/user.dart';
import '../../../data/services/get/box_system.dart';

class SystemCacheProvider with ChangeNotifier {
  Settings? settings;
  User? user;
  Server? server;
  LanguageData? languageData;
  ThemeData themeData = ThemeData();

  Future<void> run() async{
    settings = await GetBoxSystem.getSettings();

    if(settings == null) {
      settings = Settings.New();
      upTheme(settings!.theme);
      upLanguage(settings!.language);
      return;
    }
    upTheme(settings!.theme);
    upLanguage(settings!.language);

    server = await GetBoxSystem.getServer();
    if(server == null) return;

    user = await GetBoxSystem.getUser();
  }

  void upServer(Server s) => server = s;

  void upUser(User u) => user = u; 

  void upTheme(String t) {
    settings!.theme = t;
    themeData.upTheme(t);
    notifyListeners();
  }

  Future<void> upLanguage(String l) async{
    settings!.language = l;
    languageData = await LanguageData.build(l);
    notifyListeners();
  }
}