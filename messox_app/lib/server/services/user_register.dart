
import '../../data/models/system/server.dart';
import '../api/bodys/bodys.dart';
import '../api/headers/headers.dart';
import '../api/https/post.dart';
import '../api/uris/post.dart';
import '../models/client/user.dart';
import '../models/server/user.dart';
import '../repositories/user_register_repository.dart';

class ServiceUserRegister {
  final Server server;
  final UserClient user;

  ServiceUserRegister({
    required this.server,
    required this.user
  });

  Future<UserServer>register()async{
    final client = HttpPost();
    final uri = UriPost.register(server);
    final headers = Headers.toJson('');
    final body = Bodys.acess(user);

    final repo = RepositoryUserRegister(
      client: client,
      uri: uri,
      headers: headers,
      body: body
    );
    
    return await repo.request();
  }
}