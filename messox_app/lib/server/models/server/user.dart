import 'dart:convert';
import 'dart:typed_data';

class UserServer {
  final String token;
  final String name;
  final String bio;
  final Uint8List profile;

  UserServer({
    required this.token,
    required this.name,
    required this.bio,
    required this.profile
  });

  factory UserServer.fromJson(Map<String, dynamic> json){
    String base64String = json['profile'];
    Uint8List bytes = base64Decode(base64String);
    return UserServer(
      token: json['token'] ?? '', 
      name: json['name'] ?? '', 
      bio: json['bio'], 
      profile: bytes
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'name': name,
      'bio': bio,
      'profile': base64Encode(profile),
    };
  }
} 