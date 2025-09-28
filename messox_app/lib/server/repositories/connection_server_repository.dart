import '../api/https/get.dart';
import '../exceptions/api.dart';
// import 'time.dart';

const Duration time = Duration(seconds: 3);

class RepositoryConnectionServer {
  final HttpGet client;
  final Uri uri;
  final Map<String, String> headers;

  RepositoryConnectionServer({
    required this.client,
    required this.uri,
    required this.headers
  }); 

  Future<bool> request()async{
    print('REPOSITORY CHAMADO');
    print('\nURI -> $uri');
    final resp = await client.get(uri: uri, headers: headers, time: time);
    print('MORREU O TEMPO');

    switch(resp.statusCode) {
      case 200:
        return true;
      case 401:
        return false;
      default:
        throw RequestException(code: resp.statusCode);
    }
  }
}