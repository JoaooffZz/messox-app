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
    // throw RequestError(code: 500);
    await Future.delayed(const Duration(milliseconds: 5000));
    return true;
    await Future.delayed(const Duration(milliseconds: 5000));
    throw RequestError(code: 500);
    // final resp = await RunWithTimeout.run(
    //   () => client.get(uri: uri, headers: headers), 
    //   const Duration(seconds: maxTime)
    // );

    // switch(resp.statusCode) {
    //   case 200:
    //     return true;
    //   case 401:
    //     return false;
    //   default:
    //     throw RequestError(code: resp.statusCode);
    // }
  }
}