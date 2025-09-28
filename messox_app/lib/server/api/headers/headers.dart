class Headers {
  static Map<String, String> toJson(String token) {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
  static Map<String, String> toNoType(String token) {
    return {
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
  }
  static Map<String, String> toWs(String token) {
    return {
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
      'Upgrade': 'websocket',
      'Connection': 'Upgrade'
    };
  }
}