class RequestError implements Exception{
  final String message;
  RequestError({required this.message});
}

class ConnectionServerError implements Exception{
  final String message;
  ConnectionServerError({required this.message});
}

class TimeOutRequestError implements Exception{
  final String message;
  TimeOutRequestError({
    required this.message
  });
}