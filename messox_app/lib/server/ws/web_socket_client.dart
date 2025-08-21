import 'package:socket_io_client/socket_io_client.dart' as IO;

class WebSocketClient {
  // final Uri uri;

  // WebSocketClient({required this.uri});

  static IO.Socket get() {
    return IO.io(
      'http://localhost:3000',
      IO.OptionBuilder()
      .setTransports(['websocket'])
      .disableAutoConnect()
      .build()
    );
  }
}

