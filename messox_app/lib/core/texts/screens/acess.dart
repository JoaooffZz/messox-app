class AccessTexts {
  final Carousel carousel;
  final Introduction introduction;
  final Form form;
  final String changeServer;
  final Buttons bottom;

  AccessTexts({
    required this.carousel,
    required this.introduction,
    required this.form,
    required this.changeServer,
    required this.bottom,
  });

  factory AccessTexts.fromJson(Map<String, dynamic> json) {
    return AccessTexts(
      carousel: Carousel.fromJson(json['carousel'] ?? {}),
      introduction: Introduction.fromJson(json['introduction'] ?? {}),
      form: Form.fromJson(json['form'] ?? {}),
      changeServer: json['change_server'] ?? '',
      bottom: Buttons.fromJson(json['buttons'] ?? {}),
    );
  }
}

class Carousel {
  final String login;
  final String register;

  Carousel({
    required this.login,
    required this.register,
  });

  factory Carousel.fromJson(Map<String, dynamic> json) {
    return Carousel(
      login: json['login'] ?? '',
      register: json['register'] ?? '',
    );
  }
}

class Introduction {
  final String oneLogin;
  final String twoLogin;
  final String oneRegister;
  final String twoRegister;

  Introduction({
    required this.oneLogin,
    required this.twoLogin,
    required this.oneRegister,
    required this.twoRegister,
  });

  factory Introduction.fromJson(Map<String, dynamic> json) {
    return Introduction(
      oneLogin: json['one_login'] ?? '',
      twoLogin: json['two_login'] ?? '',
      oneRegister: json['one_register'] ?? '',
      twoRegister: json['two_register'] ?? '',
    );
  }
}

class Form {
  final String user;
  final String password;

  Form({
    required this.user,
    required this.password,
  });

  factory Form.fromJson(Map<String, dynamic> json) {
    return Form(
      user: json['user'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

class Buttons {
  final String login;
  final String register;

  Buttons({
    required this.login,
    required this.register,
  });

  factory Buttons.fromJson(Map<String, dynamic> json) {
    return Buttons(
      login: json['login'] ?? '',
      register: json['register'] ?? '',
    );
  }
}
