import '../../../data/models/system/server.dart';

abstract class ServerFormEvents{}

class AuthConnection extends ServerFormEvents{
  final String name;
  final String host;
  final String scheme;
  final String apiKey;

  final void Function(Server server) upCacheServer;

  AuthConnection({
    required this.name,
    required this.host,
    required this.scheme,
    required this.apiKey,
    required this.upCacheServer
  });
}