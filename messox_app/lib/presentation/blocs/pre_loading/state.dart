abstract class PreLoadingState {}

class Loaded extends PreLoadingState{
  final String Function() curiositiesFoxGet;
  Loaded({required this.curiositiesFoxGet});
}
class GoServer extends PreLoadingState{
}
class GoAcess extends PreLoadingState {
}
class GoHome extends PreLoadingState {
}