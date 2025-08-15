// import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class WebSocketProvider with ChangeNotifier {
  late IO.Socket _socket;
  bool _connected = false;

  bool get isConnected => _connected;
  // IO.Socket get socket => _socket;

  // WebSocketProvider(IO.Socket socket) {
  //   _socket = socket;
  //   _registerListeners();
  // }

  /// Inicia a conexão com o servidor
  void run() {
    if (!_socket.connected) {
      debugPrint('Iniciando conexão com o servidor...');
      _socket.connect();
    }
  }

  /// Fecha a conexão manualmente
  void disconnect() {
    _socket.disconnect();
    _connected = false;
    notifyListeners();
  }

  void _registerListeners() {
    // Conectado com sucesso
    _socket.onConnect((_) {
      _connected = true;
      notifyListeners();
      debugPrint('Conexão estabelecida ✅');
    });

    // Recebendo mensagens
    _socket.on('message', (data) {
      try {
        // String decodedString = utf8.decode(base64.decode(data));
        // debugPrint('Mensagem decodificada: $decodedString');
        // Aqui você pode converter para a model específica
        // Exemplo: final model = MyModel.fromJson(jsonDecode(decodedString));
        // notifyListeners() se precisar atualizar UI
      } catch (e) {
        debugPrint('Erro ao decodificar mensagem: $e');
      }
    });

    // Erro ao conectar
    _socket.onConnectError((err) {
      _connected = false;
      debugPrint('Erro na conexão ❌: $err');
      _tryReconnect();
    });

    // Erro genérico
    _socket.onError((err) {
      _connected = false;
      debugPrint('Erro inesperado ⚠️: $err');
      _tryReconnect();
    });

    // Desconexão
    _socket.onDisconnect((_) {
      _connected = false;
      debugPrint('Conexão perdida 🔌');
      _tryReconnect();
    });
  }

  /// Tenta reconectar automaticamente
  void _tryReconnect() async {
    debugPrint('Tentando reconectar em 2 segundos...');
    await Future.delayed(const Duration(seconds: 2));
    run();
  }
}
