class TokenModel {
  final String accessToken;
  final String tokenType;

  TokenModel({required this.accessToken, required this.tokenType});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
    );
  }
}

class SigninModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SigninModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory SigninModel.fromJson(Map<String, String> json) {
    return SigninModel(
      firstName: json['first_name']!,
      lastName: json['last_name']!,
      email: json['email']!,
      password: json['password']!,
    );
  }

  Map<String, String> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
    };
  }
}
