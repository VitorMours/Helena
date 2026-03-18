import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helena_app/models/authModels.dart';
import 'package:helena_app/services/auth_service.dart';
import 'package:helena_app/shared/result.dart';

class SigninPageViewModel extends ChangeNotifier {
  Icon passwordVisibilitysuffixIcon = Icon(Icons.visibility_off);
  Icon retypePasswordVisibilitysuffixIcon = Icon(Icons.visibility_off);
  bool _passwordVisibility = false;
  bool _retypePasswordVisibility = false;
  bool _signinIsLoading = false;
  final AuthService _authService;

  SigninPageViewModel({required AuthService authService})
    : _authService = authService;

  bool get passwordVisibility => _passwordVisibility;
  bool get retypePasswordVisibility => _retypePasswordVisibility;
  bool get signinIsLoading => _signinIsLoading;

  void togglePasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  void toggleRetypePasswordVisibility() {
    _retypePasswordVisibility = !_retypePasswordVisibility;
    notifyListeners();
  }

  Future<bool> signin(
    String first_name,
    String last_name,
    String email,
    String password,
  ) async {
    try {
      final Result<SigninModel> result = await _authService.signin(
        first_name,
        last_name,
        email,
        password,
      );

      switch (result) {
        case Ok<SigninModel>():

          // TODO: Account created, need to login
          // TODO: precisa fazer a requisicao de login
          notifyListeners();
          return true;
        case Error<String>():
        // Any Error

        default:
          break;
      }
    } catch (e) {
      return false;
    }
  }
}
