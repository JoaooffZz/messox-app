import '../exceptions/api.dart';

// class RunWithTimeout {
//   static Future<T> run<T>(
//     Future<T> Function() action,
//     Duration maxTimeout,
//   ) async {
//     return await action().timeout(
//       maxTimeout,
//       onTimeout: () {
//         throw TimeOutRequestError(message: "request time exceeded, maxTime: $maxTimeout");
//       },
//     );
//   }
// }

import 'package:http/http.dart' as http;

class RunWithTimeout {
  static Future<T> run<T>(
    Future<T> Function(http.Client client) action,
    Duration maxTimeout,
  ) async {
    final client = http.Client();
    try {
      return await action(client).timeout(
        maxTimeout,
        onTimeout: () {
          client.close(); // fecha todas as conexões abertas
          throw TimeOutRequestException(
            message: "request time exceeded, maxTime: $maxTimeout",
          );
        },
      );
    } finally {
      client.close();
    }
  }
}