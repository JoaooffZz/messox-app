class ServerFormTexts {
  final Forms forms;
  final String button;
  final Introduction introduction;

  ServerFormTexts({
    required this.forms,
    required this.button,
    required this.introduction,
  });

  factory ServerFormTexts.fromJson(Map<String, dynamic> json) {
    return ServerFormTexts(
      forms: Forms.fromJson(json['forms'] ?? {}),
      button: json['button'] ?? '',
      introduction: Introduction.fromJson(json['introduction'] ?? {}),
    );
  }
}

class Forms {
  final String name;
  final String host;
  final String scheme;
  final String apiKey;

  Forms({
    required this.name,
    required this.host,
    required this.scheme,
    required this.apiKey,
  });

  factory Forms.fromJson(Map<String, dynamic> json) {
    return Forms(
      name: json['name'] ?? '',
      host: json['host'] ?? '',
      scheme: json['scheme'] ?? '',
      apiKey: json['api_key'] ?? '',
    );
  }
}

class Introduction {
  final String one;
  final String two;

  Introduction({
    required this.one,
    required this.two,
  });

  factory Introduction.fromJson(Map<String, dynamic> json) {
    return Introduction(
      one: json['one'] ?? '',
      two: json['two'] ?? '',
    );
  }
}
