// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;

// Future<Map<String, dynamic>> loadLocale(String localeCode) async {
//   // Caminho para o arquivo baseado no código do idioma
//   String path = 'assets/locales/$localeCode.json';
//   // Carrega a string bruta do arquivo
//   String jsonString = await rootBundle.loadString(path);
//   // Decodifica a string JSON em um Map Dart
//   Map<String, dynamic> jsonMap = jsonDecode(jsonString);
//   return jsonMap;
// }

// // Uso exemplo:
// void main() async {
//   Map<String, dynamic> strings = await loadLocale('pt-BR');
//   p