import '../../../server/erros/api.dart';

abstract class ServerFormState{}

class Loading extends ServerFormState{

}

class Error extends ServerFormState{
  final ApiCustomErros error;

  Error({required this.error});
}

class Sucess extends ServerFormState{

}

class NotAuth extends ServerFormState {
  
}
