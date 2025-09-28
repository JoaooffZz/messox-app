part of 'bloc.dart';

abstract class ServerFormState{}

class Loading extends ServerFormState{

}

class ApiExceptions extends ServerFormState{
  final ApiCustomExceptions error;

  ApiExceptions({required this.error});
}

class Sucess extends ServerFormState{

}

class NotAuth extends ServerFormState {
  
}
