abstract class ApiCustomErros implements Exception{}

class RequestError extends ApiCustomErros{
  final int code;
  final String? message;
  RequestError({
    required this.code,
    this.message
  });
}

class ConnectionServerError extends ApiCustomErros{
  final String message;
  ConnectionServerError({required this.message});
}

class TimeOutRequestError extends ApiCustomErros{
  final String message;
  TimeOutRequestError({
    required this.message
  });
}