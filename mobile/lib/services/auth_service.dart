import "package:dio/dio.dart";
import "package:helena_app/models/authModels.dart";
import "package:helena_app/utils/http.dart";

class AuthService {
  final client = ApiClient.client;

  Future<TokenModel> login(String email, String password) async {
    try {
      final response = await client.post(
        "/auth/login",
        data: {"email": email, "password": password},
      );
      return TokenModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw "E-mail ou senha incorretos.";
      }
      throw "Erro ao conectar com o servidor.";
    }
  }

  Future<SigninModel> signin(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      final response = await client.post(
        "/auth/signin",
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
        },
      );
      return SigninModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw "Esse usuario ja existe";
      }
      throw "Erro ao conectar com o servidor.";
    }
  }
}
