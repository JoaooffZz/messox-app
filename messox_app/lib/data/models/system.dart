class System {
  final String theme;
  final String language;
  final Server? server;
  final User? user;

  System({
    required this.theme,
    required this.language,
    required this.server,
    required this.user
  });

  Map<String, dynamic>toJson() => {
    'theme': theme,
    'language': language,
    'server': server,
    'user': user
  };

  factory System.fromJson(Map<String, dynamic> json) => System(
    theme: json['theme'] as String,
    language: json['language'] as String,
    server: json['server'] != null
        ? Server.fromJson(Map<String, dynamic>.from(json['server']))
        : null,
    user: json['user'] != null
        ? User.fromJson(Map<String, dynamic>.from(json['user']))
        : null,
  );
}

class User {
  final int id;
  final String name;
  final String profile;
  final String token;
  
  User({
    required this.id,
    required this.name,
    required this.profile,
    required this.token
  });

  Map<String, dynamic>toJson() => {
    'id': id,
    'name': name,
    'profile': profile,
    'token': token
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int,
    name: json['name'] as String,
    profile: json['profile'] as String,
    token: json['token'] as String
  );
}

class Server {
  final String name;
  final String host;
  final String scheme;

  Server({
    required this.name,
    required this.host,
    required this.scheme
  });

  Map<String, dynamic>toJson() => {
    'name': name,
    'host': host,
    'scheme': scheme,
  };

  factory Server.fromJson(Map<String, dynamic> json) => Server(
    name: json['name'] as String,
    host: json['host'] as String,
    scheme: json['scheme'] as String
  );
}

