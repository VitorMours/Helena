import "package:dio/dio.dart";
import "package:helena_app/models/authModels.dart";
import "package:helena_app/utils/http.dart";
import "../shared/result.dart";

class AuthService {
  final client = ApiClient.client;

  Future<Result<TokenModel>> login(String email, String password) async {
    try {
      final response = await client.post(
        "/auth/login",
        data: {"email": email, "password": password},
      );
      return Result.ok(TokenModel.fromJson(response.data));
    } on DioException catch (exception) {
      return Result.error(exception);
    }
  }

  Future<Result<SigninModel>> signin(
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
      return Result.ok(SigninModel.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        return Result.error("Esse usuario ja existe" as Exception);
      }
      throw "Erro ao conectar com o servidor.";
    }
  }
}
