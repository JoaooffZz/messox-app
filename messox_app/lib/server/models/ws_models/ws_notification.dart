class WsNotification {
  final UserState userState;

  WsNotification({required this.userState});

  factory WsNotification.fromJson(Map<String, dynamic> json) {
    return WsNotification(
      userState: UserState.fromJson(json['user_state'])
    );
  }
}

class UserState {
  final bool isOnline;

  UserState({
    required this.isOnline
  });

  factory UserState.fromJson(Map<String, dynamic> json) {
    return UserState(
      isOnline: json['is_online']
    );
  }
}