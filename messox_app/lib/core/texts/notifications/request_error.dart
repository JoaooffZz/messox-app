import 'close.dart';

class RequestErrorTexts {
  final String preview;
  final Content content;
  final Close close;

  RequestErrorTexts({
    required this.preview,
    required this.content,
    required this.close,
  });

  factory RequestErrorTexts.fromJson(Map<String, dynamic> json) {
    return RequestErrorTexts(
      preview: json['error_request']['preview'] ?? '',
      content: Content.fromJson(json['error_request']['content'] ?? {}),
      close: Close.fromJson(json['close'] ?? {}),
    );
  }
}

class Content {
  final String body;
  final String code;

  Content({
    required this.body,
    required this.code,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      body: json['body'] ?? '',
      code: json['code'] ?? '',
    );
  }
}

