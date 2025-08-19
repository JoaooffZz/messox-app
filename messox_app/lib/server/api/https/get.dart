import 'package:http/http.dart' as http;

import '../../erros/api.dart';

abstract class IHttpGet {
  Future<http.Response> get({
    required Uri uri,
    Map<String, String>? headers, // ⬅️ Headers opcionais
  });
}

class HttpGet implements IHttpGet {
  final _client = http.Client();

  @override
  Future<http.Response> get({
    required Uri uri,
    Map<String, String>? headers,
  }) async {
    try {
      return await _client.get(
        uri,
        headers: headers,
      );
    } catch(e) {
      throw ConnectionServerError(message: e.toString());
    }finally {
      _client.close();
    }
  }
}