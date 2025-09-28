import '../../models/client/user.dart';

class Bodys {
  static Map<String, dynamic> acess(UserClient user) => {
    'name': user.name,
    'password': user.password
  };
}