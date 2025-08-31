import 'error_request.dart';

class NotificationsTexts {
  final ErrorRequestTexts errorRequestTexts;

  NotificationsTexts({
    required this.errorRequestTexts
  });

  factory NotificationsTexts.fromJson(dynamic json) {
    return NotificationsTexts(
      errorRequestTexts: ErrorRequestTexts.fromJson(json['error_request'])
    );
  }
}