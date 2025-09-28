library TextsServerForm;

class Texts {
  final Forms forms;
  final String button;
  final Introduction introduction;
  final Mixins mixins;

  Texts({
    required this.forms,
    required this.button,
    required this.introduction,
    required this.mixins
  });

  factory Texts.fromJson(Map<String, dynamic> json) {
    return Texts(
      forms: Forms.fromJson(json['forms'] ?? {}),
      button: json['button'] ?? '',
      introduction: Introduction.fromJson(json['introduction'] ?? {}),
      mixins: Mixins.fromJson(json['mixins'] ?? {})
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

class Mixins {
  final Scheme scheme;
  final Host host;
  final Name name;

  Mixins({
    required this.name,
    required this.host,
    required this.scheme
  });

  factory Mixins.fromJson(Map<String, dynamic> json) {
    return Mixins(
      name: Name.fromJson(json['name'] ?? {}), 
      host: Host.fromJson(json['host'] ?? {}), 
      scheme: Scheme.fromJson(json['scheme'] ?? {})
    );
  }
}

class Scheme {
  final String notEmpty;
  final String notHttp;

  Scheme({
    required this.notEmpty,
    required this.notHttp,
  });

  factory Scheme.fromJson(Map<String, dynamic> json) {
    return Scheme(
      notEmpty: json['not_empty'] ?? '',
      notHttp: json['not_http'] ?? ''
    );
  }
}
class Host {
  final String notEmpty;

  Host({required this.notEmpty});

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(notEmpty: json['not_empty'] ?? '');
  }
}
class Name {
  final String notEmpty;

  Name({required this.notEmpty});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(notEmpty: json['not_empty'] ?? '');
  }
}