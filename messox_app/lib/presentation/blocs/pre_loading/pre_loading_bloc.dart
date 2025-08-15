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
      }
      if (event.system != null) {
        final cur = CuriositiesFox(language: event.system!.language);
        _outputStateController.add(Loaded(curiositiesFoxGet: cur.get));

        if(event.system!.server == null) {
          _serverNotFound();
        }
        if(event.system!.user == null) {
          _userNotFound();
        }
      }

    }    
  }
  void _primaryAcess() {
    final cur = CuriositiesFox(language: 'en-us');
    _outputStateController.add(Loaded(curiositiesFoxGet: cur.get));
    Future.delayed(Duration(milliseconds: 1200)).then((_) {
      _outputStateController.add(GoFormServer());
    });
  }

  void _serverNotFound() {
    Future.delayed(Duration(milliseconds: 1200)).then((_) {
      _outputStateController.add(GoFormServer());
    });
  }

  void _userNotFound() {
    Future.delayed(Duration(milliseconds: 1200)).then((_) {
      _outputStateController.add(GoAcess());
    });
  }
}