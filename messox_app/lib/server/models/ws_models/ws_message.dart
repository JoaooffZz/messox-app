class WsMessage {
  final int sender;
  final int addressee;
  final String message;
  final String date;

  WsMessage({
    required this.sender,
    required this.addressee,
    required this.message,
    required this.date
  });

  factory WsMessage.fromJson(Map<String, dynamic> json) {
    return WsMessage(
      sender: json['sender'],
      addressee: json['addressee'],
      message: json['message'],
      date: json['date']
    );
  }
}