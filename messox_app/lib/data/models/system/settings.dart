class Settings {
  String theme;
  String language;

  Settings({
    required this.theme,
    required this.language,
  });

  Map<String, dynamic>toJson() => {
    'theme': theme,
    'language': language,
  };

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    theme: json['theme'] as String,
    language: json['language'] as String,
  );

  factory Settings.New() => Settings(
    theme: 'dark', 
    language: 'pt-br', 
  );
}

