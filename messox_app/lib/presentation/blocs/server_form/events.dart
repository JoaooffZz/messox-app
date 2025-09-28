part of 'bloc.dart';

abstract class ServerFormEvents{}

class AuthConnection extends ServerFormEvents{
  final String name;
  final String host;
  final String scheme;
  final String apiKey;

  AuthConnection({
    required this.name,
    required this.host,
    required this.scheme,
    required this.apiKey,
  });
}