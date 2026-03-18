import 'package:flutter/material.dart';
import 'package:helena_app/models/authModels.dart';
import 'package:helena_app/services/auth_service.dart';
import 'package:helena_app/shared/result.dart';
import '../../../../../services/jwt_storage_service.dart';

class LoginPageViewModel extends ChangeNotifier {
  final AuthService _authService;
  final JWTStorageService _storageService;

  bool _loginIsLoading = false;
  String? _loginError;
  bool _visibility = false;

  LoginPageViewModel({
    required AuthService authService,
    required JWTStorageService storageService,
  }) : _authService = authService,
       _storageService = storageService;

  bool get visibility => _visibility;
  bool get loginIsLoading => _loginIsLoading;
  String? get loginError => _loginError;

  void toggleVisibility() {
    _visibility = !_visibility;
    notifyListeners();
  }

  void clearError() {
    _loginError = null;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _loginIsLoading = true;
    _loginError = null;
    notifyListeners();

    try {
      final Result<TokenModel> result = await _authService.login(
        email,
        password,
      );

      switch (result) {
        case Ok<TokenModel>():
          _storageService.saveJwt(result.value.accessToken);
          _loginIsLoading = false;
          notifyListeners();
          return true;

        case Error<TokenModel>():
          _loginError = "E-mail ou senha incorretos";
          _loginIsLoading = false;
          notifyListeners();
          return false;
      }
    } catch (e) {
      _loginError = "Erro inesperado, tente novamente.";
      _loginIsLoading = false;
      notifyListeners();
      return false;
    }
  }
}
