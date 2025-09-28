import 'dart:convert';

import '../api/https/post.dart';
import '../exceptions/acess.dart';
import '../exceptions/api.dart';
import '../models/server/user.dart';
import 'time.dart';

const int maxTime = 6;

class RepositoryUserRegister{
  final HttpPost client;
  final Uri uri;
  final Map<String, String> headers;
  final Map<String, dynamic> body;

  RepositoryUserRegister({
    required this.client,
    required this.headers,
    required this.uri,
    required this.body
  });

  Future<UserServer> request()async{
    final resp = await RunWithTimeout.run(
      () => client.post(uri: uri, body: body,headers: headers), 
      const Duration(seconds: maxTime)
    );

    switch(resp.statusCode) {
      case 201:
        final json = jsonDecode(resp.body);
        return UserServer.fromJson(json);
      case 409:
        final json = jsonDecode(resp.body);
        throw UserAlreadyExistsError(name: json['field'] ?? '');
      case 413:
        final json = jsonDecode(resp.body);
        throw UserStringLengthExceededError(field: json['field'] ?? '');
      default:
        throw RequestException(code: resp.statusCode);
    }
  }
}