class Close {
  final String first;
  final String last;

  Close({
    required this.first,
    required this.last,
  });

  factory Close.fromJson(Map<String, dynamic> json) {
    return Close(
      first: json['first'] ?? '',
      last: json['last'] ?? '',
    );
  }
}