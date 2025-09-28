class Chat {
  final int id;
  String name;
  String profile;
  String? bio;
  LastMessage? lastMessage;

  Chat({
    required this.id,
    required this.name,
    required this.profile,
    this.bio,
    this.lastMessage,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'profile': profile,
        'bio': bio,
        'last_message': lastMessage?.toJson(),
      };

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json['id'] as int,
        name: json['name'] as String,
        profile: json['profile'] as String,
        bio: json['bio'] as String?,
        lastMessage: json['last_message'] != null
            ? LastMessage.fromJson(json['last_message'])
            : null,
      );
}

class LastMessage {
  final String message;
  final int timeStamp;

  LastMessage({
    required this.message,
    required this.timeStamp,
  });

  Map<String, dynamic> toJson() => {
        'message': message,
        'time_stamp': timeStamp,
      };

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        message: json['message'] as String,
        timeStamp: json['time_stamp'] as int,
      );
}
