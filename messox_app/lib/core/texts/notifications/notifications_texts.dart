import 'not_auth.dart';
import 'request_error.dart';

class NotificationsTexts {
  final RequestErrorTexts requestErrorTexts;
  final NotAuthTexts notAuthTexts;

  NotificationsTexts({
    required this.requestErrorTexts,
    required this.notAuthTexts
  });

  factory NotificationsTexts.fromJson(dynamic json) {
    return NotificationsTexts(
      requestErrorTexts: RequestErrorTexts.fromJson(json),
      notAuthTexts: NotAuthTexts.fromJson(json)
    );
  }
}