import '../../data/models/system/server.dart';
import '../api/bodys/bodys.dart';
import '../api/headers/headers.dart';
import '../api/https/post.dart';
import '../api/uris/post.dart';
import '../models/client/user.dart';
import '../models/server/user.dart';
import '../repositories/auth_login_repository.dart';

class ServiceAuthLogin {
  final Server server;
  final UserClient user;

  ServiceAuthLogin({
    required this.server,
    required this.user
  });

  Future<UserServer> auth()async{
    final client = HttpPost();
    final uri = UriPost.login(server);
    final headers = Headers.toJson('');
    final body = Bodys.acess(user);

    final repo = RepositoryAuthLogin(
      client: client,
      uri: uri,
      headers: headers,
      body: body
    );

    return await repo.request();
  }
}