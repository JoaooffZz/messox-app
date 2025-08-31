class Contact {
  final int id;
  String name;
  String profile;
  String? bio;
  String? lastMessage;

  Contact({
    required this.id,
    required this.name,
    required this.profile,
    required this.bio,
    required this.lastMessage
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'profile': profile,
    'bio': bio,
    'lastMessage': lastMessage,
  };

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json['id'] as int,
    name: json['name'] as String,
    profile: json['profile'] as String,
    bio: json['bio'] as String?,
    lastMessage: json['lastMessage'] as String?,
  );
}