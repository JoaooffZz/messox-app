import 'close.dart';

class NotAuthTexts {
  final String preview;
  final Content content;
  final Close close;

  NotAuthTexts({required this.content, required this.preview, required this.close});

  factory NotAuthTexts.fromJson(dynamic json) {
    return NotAuthTexts(
      preview: json['not_auth']['preview'] ?? '',
      content: Content.fromJson(json['not_auth']['content'] ?? {}),
      close: Close.fromJson(json['close'] ?? {})
    );
  }
}

class Content {
  final String body;
  final String warning;

  Content({
    required this.body,
    required this.warning,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      body: json['body'] ?? '',
      warning: json['warning'] ?? '',
    );
  }
}