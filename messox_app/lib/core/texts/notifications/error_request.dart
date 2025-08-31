class ErrorRequestTexts {
  final String preview;
  final Content content;
  final Close close;

  ErrorRequestTexts({
    required this.preview,
    required this.content,
    required this.close,
  });

  factory ErrorRequestTexts.fromJson(Map<String, dynamic> json) {
    return ErrorRequestTexts(
      preview: json['preview'] ?? '',
      content: Content.fromJson(json['content'] ?? {}),
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

class Close {
  final String first;
  final String last;

  Close({
    required this.first,
    required this.last,
  });

  factory Close.fromJson(Map<String, dynamic> json) {
    return Close(
      first: json['first'] ?? '',
      last: json['last'] ?? '',
    );
  }
}
