import 'package:dio/dio.dart';

class ApiClient {
  static final Dio client = Dio(
    BaseOptions(
      baseUrl: "http://localhost:8000",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
}
