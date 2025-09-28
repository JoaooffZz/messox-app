import 'package:http/http.dart' as http;

import '../../exceptions/api.dart';

abstract class IHttpGet {
  Future<http.Response> get({
    required Uri uri,
    Map<String, String>? headers,
    Duration time,
  });
}

class HttpGet implements IHttpGet {
  final _client = http.Client();

  @override
  Future<http.Response> get({
    required Uri uri,
    Map<String, String>? headers,
    Duration time = const Duration(seconds: 5),
  }) async {
    try {
      return await _client
          .get(uri, headers: headers)
          .timeout(time, onTimeout: () {
        _client.close(); // cancela conexões
        throw TimeOutRequestException(
          message: "request time exceeded, maxTime: $time",
        );
      });
    } catch (e) {
      throw ConnectionServerException(message: e.toString());
    }
  }

  void dispose() {
    _client.close(); // fecha quando não precisar mais
  }
}
