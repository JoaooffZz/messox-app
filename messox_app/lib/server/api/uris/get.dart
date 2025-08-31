import '../../../data/models/system/server.dart';

class UriGet {
  static Uri ping(Server server) {
    return Uri(
      scheme: server.scheme,
      host: server.host,
      path: '/ping'
    );
  }
}