class Headers {
  static Map<String, String> get(String token) {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
}