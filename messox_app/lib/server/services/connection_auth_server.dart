
import '../../data/models/system.dart';
import '../api/headers/headers.dart';
import '../api/https/get.dart';
import '../api/uris/get.dart';
import '../repositories/ping_server.dart';

class ConnectionAuthServer {
  final Server server;
  
  ConnectionAuthServer({
    required this.server
  });

  Future<bool> auth()async{
    final uri = UriGet.ping(server);
    final headers = Headers.get(server.apiKey);
    final client = HttpGet();

    final repo = RepositoryPingServer(
      client: client,
      uri: uri,
      headers: headers,
    );

    return await repo.request();
  }
}