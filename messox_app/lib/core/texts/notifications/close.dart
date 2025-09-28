part of 'texts_notification.dart';

class TextsClose {
  final String first;
  final String last;

  TextsClose({required this.first, required this.last});

  factory TextsClose.fromJson(Map<String, dynamic> json) => TextsClose(
    first: json['first'] ?? '', 
    last: json['last'] ?? ''
  );
}