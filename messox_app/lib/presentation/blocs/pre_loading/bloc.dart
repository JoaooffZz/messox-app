import 'dart:async';

import '../../../core/constants/curiosities_fox.dart';
import 'events.dart';
import 'state.dart';

class PreLoadingBloc {
  final StreamController<PreLoadingEvents> _inputEventController = StreamController<PreLoadingEvents>();
  final StreamController<PreLoadingState> _outputStateController = StreamController<PreLoadingState>();

  Sink <PreLoadingEvents> get inputEvent => _inputEventController.sink;
  Stream <PreLoadingState> get outputState => _outputStateController.stream;

  PreLoadingBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }
  void _mapEventToState(PreLoadingEvents event) async {

    if(event is PreInitSystem) {
      _loaded(event.settings.language);

      if (event.server == null) {
        _serverNotFound();
        return;
      }
      if (event.user == null) {
        _userNotFound();
        return;
      }

      _initUserHome();
    }    
  }
  void _loaded(String language) {
    final cur = CuriositiesFox(language: language);
    _outputStateController.add(Loaded(curiositiesFoxGet: cur.get));
  }

  void _serverNotFound() {
    Future.delayed(Duration(milliseconds: 1500)).then((_) {
      _outputStateController.add(GoServer());
    });
  }
  void _userNotFound() {
    Future.delayed(Duration(milliseconds: 1500)).then((_) {
      _outputStateController.add(GoAcess());
    });
  }

  void _initUserHome() {
    // inicializar os providers cache de home
    // ir para home
  }
}