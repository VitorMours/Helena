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
}
