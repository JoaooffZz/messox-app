import 'package:http/http.dart' as http;
import '../../exceptions/api.dart';

abstract class IHttpPost{
  Future<http.Response> post({
    required Uri uri,
    required Map<String, dynamic> body,
    Map<String, String>? headers, // ⬅️ Headers opcionais
  });
}

class HttpPost implements IHttpPost {
  final _client = http.Client();

  @override
  Future<http.Response> post({
    required Uri uri,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      return await _client.post(
        uri,
        headers: headers,
        body: body
      );
    } catch(e) {
      throw ConnectionServerException(message: e.toString());
    }finally {
      _client.close();
    }
  }
}