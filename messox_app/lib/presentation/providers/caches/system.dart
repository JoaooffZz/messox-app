import 'package:flutter/material.dart';

import '../../../data/models/system.dart';
import '../../../data/services/get/get_system.dart';

class SystemCacheProvider with ChangeNotifier {
  bool isInitialized = false;

  late System? _system;
  
  System? get system => _system;
  String get theme => _system!.theme;
  String get language => _system!.language;
  User get user => _system!.user!;
  Server get server => _system!.server!;

  Future<void> run() async{
    if (isInitialized) return;
    _system = await GetSystem.get();
    isInitialized = true;
  }

  void upSystem(System newSystem) {
    if (!isInitialized) return;
    _system = newSystem;
    return;
  }

  void upTheme(String them) {
    if (!isInitialized) return;

    _system = System(
      theme: them,
      language: _system!.language,
      server: _system!.server,
      user: _system!.user,
    );

    notifyListeners();
  }

  void upLanguage(String lang) {
    if (!isInitialized) return;

    _system = System(
      theme: _system!.theme,
      language: lang,
      server: _system!.server,
      user: _system!.user,
    );
    
    notifyListeners();
  }
}