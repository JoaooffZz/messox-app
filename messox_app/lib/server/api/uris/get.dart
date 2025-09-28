import '../../../data/models/system/server.dart';

class UriGet {
  static Uri ping(Server server) {
    return Uri.parse("${server.scheme}://${server.host}/server/ping");
  }
}