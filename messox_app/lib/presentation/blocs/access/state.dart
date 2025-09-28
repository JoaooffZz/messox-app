part of 'bloc.dart';

abstract class AcessState{}

class Loading extends AcessState {
  
}

class Error extends AcessState{
  final ApiCustomExceptions error;

  Error({required this.error});
}

class Sucess extends AcessState{

}

class NotAuth extends AcessState{

}

class GoServForm extends AcessState{

}