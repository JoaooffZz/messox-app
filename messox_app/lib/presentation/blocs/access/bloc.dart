library acessBloc;

import 'dart:async';

import '../../../server/exceptions/api.dart';

part 'state.dart';
part 'events.dart';

class AcessBloc {
  final StreamController<AcessEvents> _inputEventController = StreamController<AcessEvents>();
  final StreamController<AcessState> _outputStateController = StreamController<AcessState>();

  Sink <AcessEvents> get inputEvent => _inputEventController.sink;
  Stream <AcessState> get outputState => _outputStateController.stream;

  bloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }
  void _mapEventToState(AcessEvents event) async {

  }
}
