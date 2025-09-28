abstract class PreLoadingState {}

class Loaded extends PreLoadingState{
  final List<String> curiosities;
  Loaded({required this.curiosities});
}
class GoServer extends PreLoadingState{
}
class GoAcess extends PreLoadingState {
}
class GoHome extends PreLoadingState {
}