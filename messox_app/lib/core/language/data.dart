import 'dart:convert';

import 'package:flutter/services.dart';

import '../texts/notifications/notifications_texts.dart';
import '../texts/screens/screens_texts.dart';

class DataLanguage {
  final ScreensTexts screensTexts;
  final NotificationsTexts notificationsTexts;

  DataLanguage({
    required this.notificationsTexts,
    required this.screensTexts
  });

  static Future<DataLanguage> build(String language) async {
    late Map<String, dynamic> json;
    switch(language) {
      case 'pt-br':
        json = await _loadLocale('pt-br');
      case 'en-us':
        json = await _loadLocale('en-us');
    }

    return DataLanguage._fromJson(json);
  }

  static Future<Map<String, dynamic>> _loadLocale(String localeCode) async {
    // Caminho para o arquivo baseado no código do idioma
    String path = 'assets/locales/$localeCode.json';
    // Carrega a string bruta do arquivo
    String jsonString = await rootBundle.loadString(path);
    // Decodifica a string JSON em um Map Dart
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }

  factory DataLanguage._fromJson(Map<String, dynamic> json) {
    print('${json}');
    return DataLanguage(
      notificationsTexts: NotificationsTexts.fromJson(json['notifications']), 
      screensTexts: ScreensTexts.fromJson(json['screens'])
    );
  }
}