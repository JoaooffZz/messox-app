import '../../../server/erros/api.dart';

abstract class ServerFormState{}

class Loading extends ServerFormState{

}

class Loaded extends ServerFormState{
  
}

class Error extends ServerFormState{
  final ApiCustomErros apiCustomError;

  Error({required this.apiCustomError});
}

class Sucess extends ServerFormState{

}

class NotAuth extends ServerFormState {
  
}
