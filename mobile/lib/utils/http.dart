import 'package:dio/dio.dart';

class ApiClient {
  static final Dio client = Dio(
    BaseOptions(
      baseUrl: "http://localhost:8000",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
}
