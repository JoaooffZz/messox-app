abstract class ApiCustomExceptions implements Exception{}

class RequestException extends ApiCustomExceptions{
  final int code;
  final String? message;
  RequestException({
    required this.code,
    this.message
  });
}

class ConnectionServerException extends ApiCustomExceptions{
  final String message;
  ConnectionServerException({required this.message});
}

class TimeOutRequestException extends ApiCustomExceptions{
  final String message;
  TimeOutRequestException({
    required this.message
  });
}