import '../../../data/models/system.dart';

class UriGet {
  static Uri ping(Server server) {
    return Uri(
      scheme: server.scheme,
      host: server.host,
      path: '/ping'
    );
  }
}