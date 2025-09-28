part of 'texts_notification.dart';

class TextsNotificationExceptions {
  final ApiExceptions api;

  TextsNotificationExceptions({required this.api});

  factory TextsNotificationExceptions.fromJson(Map<String, dynamic> json) {
    return TextsNotificationExceptions(
      api: ApiExceptions.fromJson(json['api']),
    );
  }
}

class ApiExceptions {
  final ErrorRequest errorRequest;
  final NotAuth notAuth;
  final TimeOut timeOut;
  final ConnectionServer connectionServer;

  ApiExceptions({
    required this.errorRequest,
    required this.notAuth,
    required this.timeOut,
    required this.connectionServer
  });

  factory ApiExceptions.fromJson(Map<String, dynamic> json) {
    return ApiExceptions(
      errorRequest: ErrorRequest.fromJson(json['error_request']),
      notAuth: NotAuth.fromJson(json['not_auth']),
      timeOut: TimeOut.fromJson(json['time_out']),
      connectionServer: ConnectionServer.fromJson(json['connection_server'])
    );
  }
}

class ErrorRequest {
  final String preview;
  final List<String> messages;

  ErrorRequest({required this.preview, required this.messages});

  factory ErrorRequest.fromJson(Map<String, dynamic> json) {
    return ErrorRequest(
      preview: json['preview'],
      messages: List<String>.from(json['messages']),
    );
  }
}

class NotAuth {
  final String preview;
  final List<String> messages;

  NotAuth({required this.preview, required this.messages});

  factory NotAuth.fromJson(Map<String, dynamic> json) {
    return NotAuth(
      preview: json['preview'],
      messages: List<String>.from(json['messages']),
    );
  }
}

class TimeOut {
  final String preview;
  final List<String> messages;

  TimeOut({required this.preview, required this.messages});

  factory TimeOut.fromJson(Map<String, dynamic> json) {
    return TimeOut(
      preview: json['preview'],
      messages: List<String>.from(json['messages']),
    );
  }
}

class ConnectionServer {
  final String preview;
  final List<String> messages;

  ConnectionServer({required this.preview, required this.messages});

  factory ConnectionServer.fromJson(Map<String, dynamic> json) {
    return ConnectionServer(
      preview: json['preview'],
      messages: List<String>.from(json['messages']),
    );
  }
}