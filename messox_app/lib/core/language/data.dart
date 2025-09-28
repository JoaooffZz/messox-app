import 'dart:convert';

import 'package:flutter/services.dart';

import '../texts/notifications/texts_notification.dart';
import '../texts/screens/screens_texts.dart';

class LanguageData {
  final ScreensTexts textsScreens;
  final TextsNotifications textsNotifications;

  LanguageData({
    required this.textsNotifications,
    required this.textsScreens
  });

  static Future<LanguageData> build(String language) async {
    late Map<String, dynamic> json;
    switch(language) {
      case 'pt-br':
        json = await _loadLocale('pt-br');
      case 'en-us':
        json = await _loadLocale('en-us');
    }

    return LanguageData._fromJson(json);
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

  factory LanguageData._fromJson(Map<String, dynamic> json) {
    print('${json}');
    return LanguageData(
      textsNotifications: TextsNotifications.fromJson(json['notifications']), 
      textsScreens: ScreensTexts.fromJson(json['screens'])
    );
  }
}