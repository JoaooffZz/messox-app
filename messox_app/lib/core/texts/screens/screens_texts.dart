import 'acess.dart';
import 'server_form.dart';

class ScreensTexts {
  final AccessTexts accessTexts;
  final Texts serverFormTexts;

  ScreensTexts({
    required this.accessTexts,
    required this.serverFormTexts
  });

  factory ScreensTexts.fromJson(dynamic json) {
    return ScreensTexts(
      accessTexts: AccessTexts.fromJson(json['access']),
      serverFormTexts: Texts.fromJson(json['server_form'])
    );
  }
}