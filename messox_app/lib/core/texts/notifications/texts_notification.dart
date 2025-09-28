library TextsNotification;

part 'exceptions.dart';
part 'close.dart';

class TextsNotifications {
  final TextsClose close;
  final TextsNotificationExceptions exceptions;

  TextsNotifications({
    required this.close,
    required this.exceptions
  });

  factory TextsNotifications.fromJson(Map<String, dynamic> json) => TextsNotifications(
    close: TextsClose.fromJson(json['close'] ?? {}),
    exceptions: TextsNotificationExceptions.fromJson(json['exceptions'] ?? {})
  );
}