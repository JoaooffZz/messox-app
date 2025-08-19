import '../erros/api.dart';

class RunWithTimeout {
  static Future<T> run<T>(
    Future<T> Function() action,
    Duration maxTimeout,
  ) async {
    return await action().timeout(
      maxTimeout,
      onTimeout: () {
        throw TimeOutRequestError(message: "request time exceeded, maxTime: $maxTimeout");
      },
    );
  }
}