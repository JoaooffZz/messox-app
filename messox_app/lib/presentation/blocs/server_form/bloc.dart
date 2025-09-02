import 'dart:async';
import '../../../data/models/system/server.dart';
import '../../../data/services/put/box_system.dart';
import '../../../server/erros/api.dart';
import '../../../server/services/connection_auth_server.dart';
import 'events.dart';
import 'state.dart';

class ServerFormBloc {
  final StreamController<ServerFormEvents> _inputEventController = StreamController<ServerFormEvents>();
  final StreamController<ServerFormState> _outputStateController = StreamController<ServerFormState>();

  Sink <ServerFormEvents> get inputEvent => _inputEventController.sink;
  Stream <ServerFormState> get outputState => _outputStateController.stream;

  ServerFormBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }
  void _mapEventToState(ServerFormEvents event) async {
    _outputStateController.add(Loading());
    if (event is AuthConnection) {
      final server = Server(
        name: event.name, host: event.host, 
        scheme: event.scheme, apiKey: event.apiKey
      );

      try {
        final bool isAuth = await ConnectionAuthServer(server: server).auth();
        if (isAuth) {
          // event.upCacheServer(server);
          // await PutBoxSystem.tableServer.up(server);
          _outputStateController.add(Sucess());
          return;
        }
        _outputStateController.add(NotAuth());
        return;
      }on ApiCustomErros catch(e){
        _outputStateController.add(Error(error: e));
        return;
      }catch(e){
        // debugar
      }
    }
  }
}