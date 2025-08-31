class User {
  final int id;
  final String name;
  String profile;
  String? bio;
  final String token;
  
  User({
    required this.id,
    required this.name,
    required this.profile,
    required this.bio,
    required this.token
  });

  Map<String, dynamic>toJson() => {
    'id': id,
    'name': name,
    'profile': profile,
    'bio': bio,
    'token': token
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int,
    name: json['name'] as String,
    profile: json['profile'] as String,
    bio: json['bio'] as String?,
    token: json['token'] as String
  );
}
