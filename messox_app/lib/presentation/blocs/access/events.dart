part of 'bloc.dart';

abstract class AcessEvents{}

class AuthLogin extends AcessEvents{
  final String name;
  final String password;
  final String apiKey;
  AuthLogin({
    required this.name,
    required this.password,
    this.apiKey = '',
  });
}