class ProfileChat {
  final int id;
  final String name;
  final String profile;
  final String? lastMessage;

  ProfileChat({
    required this.id,
    required this.name,
    required this.profile,
    required this.lastMessage
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'profile': profile,
    'lastMessage': lastMessage,
  };

  factory ProfileChat.fromJson(Map<String, dynamic> json) => ProfileChat(
    id: json['id'] as int,
    name: json['name'] as String,
    profile: json['profile'] as String,
    lastMessage: json['lastMessage'] as String?,
  );
}