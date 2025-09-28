import '../../data/models/system/server.dart';
import '../api/headers/headers.dart';
import '../api/https/get.dart';
import '../api/uris/get.dart';
import '../repositories/connection_server_repository.dart';

class ServiceConnectionServer {
  final Server server;
  
  ServiceConnectionServer({
    required this.server
  });

  Future<bool> auth()async{
    print('SERVICE CHAMADO');
    final uri = UriGet.ping(server);
    final headers = Headers.toNoType(server.apiKey);
    final client = HttpGet();

    final repo = RepositoryConnectionServer(
      client: client,
      uri: uri,
      headers: headers,
    );
    final isAuth = await repo.request();

    return isAuth;
  }
}