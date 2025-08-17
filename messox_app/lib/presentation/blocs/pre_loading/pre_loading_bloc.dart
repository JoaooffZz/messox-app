import 'dart:async';

import '../../../core/constants/curiosities_fox.dart';
import 'pre_loading_events.dart';
import 'pre_loading_state.dart';

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
      if(event.system == null) {
        _primaryAcess();
        return;
      }
      if (event.system != null) {
        _notPrimaryAcess(event.system!.language);
      }

      if(event.system!.server == null) {
        _serverNotFound();
        return;
      }

      if(event.system!.user == null) {
        _userNotFound();
        return;
      }

      _initUserHome();
    }    
  }
  
  void _primaryAcess() {
    final cur = CuriositiesFox(language: 'en-us');
    _outputStateController.add(Loaded(curiositiesFoxGet: cur.get));
    Future.delayed(Duration(milliseconds: 3000)).then((_) {
      _outputStateController.add(GoServer());
    });
  }

  void _notPrimaryAcess(String language) {
    final cur = CuriositiesFox(language: language);
    _outputStateController.add(Loaded(curiositiesFoxGet: cur.get));
  }

  void _serverNotFound() {
    Future.delayed(Duration(milliseconds: 3000)).then((_) {
      _outputStateController.add(GoServer());
    });
  }

  void _userNotFound() {
    Future.delayed(Duration(milliseconds: 2500)).then((_) {
      _outputStateController.add(GoAcess());
    });
  }

  void _initUserHome() {
    // inicializar os providers cache de home
    // ir para home
  }
}