import 'ws_message.dart';
import 'ws_notification.dart';

class WsClient {
  final String type;
  final WsMessage? wsMessage;
  final WsNotification? wsNotification;

  WsClient({
    required this.type,
    required this.wsMessage,
    required this.wsNotification
  });

  factory WsClient.fromJson(dynamic json) {
    
    if (json['type'] == 'message') {
      return WsClient(
        type: json['type'], 
        wsMessage: WsMessage.fromJson(json['message']), 
        wsNotification: null
      );
    }

    if (json['type'] == 'notification') {
      return WsClient(
        type: json['type'], 
        wsMessage: null, 
        wsNotification: WsNotification.fromJson(json['notification'])
      );
    }

    return WsClient(
      type: 'null', 
      wsMessage: null, 
      wsNotification: null
    );
  }
}
