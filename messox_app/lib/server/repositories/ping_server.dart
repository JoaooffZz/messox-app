import '../api/https/get.dart';
import '../erros/api.dart';
import 'time.dart';

const int maxTime = 3;

class RepositoryPingServer {
  final HttpGet client;
  final Uri uri;
  final Map<String, String> headers;

  RepositoryPingServer({
    required this.client,
    required this.uri,
    required this.headers
  }); 

  Future<bool> request()async{
    final resp = await RunWithTimeout.run(
      () => client.get(uri: uri, headers: headers), 
      const Duration(seconds: maxTime)
    );

    switch(resp.statusCode) {
      case 200:
        return true;
      case 401:
        return false;
      default:
        throw RequestError(message: 'status-code: ${resp.statusCode}, not expected');
    }
  }
}