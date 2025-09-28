
import 'dart:convert';

import 'package:messox_app/server/api/https/post.dart';

import '../exceptions/api.dart';
import '../exceptions/acess.dart';
import '../models/server/user.dart';
import 'time.dart';

const int maxTime = 6;

class RepositoryAuthLogin {
  final HttpPost client;
  final Uri uri;
  final Map<String, String> headers;
  final Map<String, dynamic> body;

  RepositoryAuthLogin({
    required this.client,
    required this.uri,
    required this.headers,
    required this.body
  });

  Future<UserServer> request()async{
    final resp = await RunWithTimeout.run(
      () => client.post(uri: uri, headers: headers, body: body), 
      const Duration(seconds: maxTime)
    );

    switch(resp.statusCode) {
      case 200:
        final json = jsonDecode(resp.body);
        return UserServer.fromJson(json);
      case 401:
        throw NotAuthError();
      case 404:
        throw UserNotFoundError();
      default:
        throw RequestException(code: resp.statusCode);
    }
  }
}