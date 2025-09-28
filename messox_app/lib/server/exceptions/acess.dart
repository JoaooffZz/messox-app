
class UserNotFoundError implements Exception {
}

class NotAuthError implements Exception{
}

class UserAlreadyExistsError implements Exception{
  final String name;
  UserAlreadyExistsError({required this.name});
}

class UserStringLengthExceededError implements Exception{
  final String field;
  UserStringLengthExceededError({required this.field});
}