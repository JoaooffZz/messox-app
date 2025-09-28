class UserClient {
  final String name;
  final String password;

  UserClient({
    required this.name,
    required this.password,
  });

  factory UserClient.New(String name, String password) => UserClient(
    name: name,
    password: password,
  );
}