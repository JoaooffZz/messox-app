class Server {
  final String name;
  final String host;
  final String scheme;
  final String apiKey;

  Server({
    required this.name,
    required this.host,
    required this.scheme,
    required this.apiKey
  });

  Map<String, dynamic>toJson() => {
    'name': name,
    'host': host,
    'scheme': scheme,
    'api_key': apiKey
  };

  factory Server.fromJson(Map<String, dynamic> json) => Server(
    name: json['name'] as String,
    host: json['host'] as String,
    scheme: json['scheme'] as String,
    apiKey: json['api_key'] as String
  );
}