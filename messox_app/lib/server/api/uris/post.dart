import '../../../data/models/system/server.dart';

class UriPost {
  static Uri login(Server server) {
    return Uri(
      scheme: server.scheme,
      host: server.host,
      path: '/user/login'
    );
  }
  static Uri register(Server server) {
    return Uri(
      scheme: server.scheme,
      host: server.host,
      path: '/user/register'
    );
  }
}