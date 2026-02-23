import 'package:flutter/material.dart';
import 'package:helena_app/models/authModels.dart';
import 'package:helena_app/services/auth_service.dart';
import 'package:helena_app/shared/result.dart';
import 'package:provider/provider.dart';

class LoginPageViewModel extends ChangeNotifier {
  final AuthService _authService;
  Icon suffixIcon = Icon(Icons.visibility_off);
  bool _loginIsLoading = false;
  bool _visibility = false;

  LoginPageViewModel({required AuthService authService})
    : _authService = authService;

  bool get visibility => _visibility;
  bool get loginIsLoading => _loginIsLoading;

  void toggleVisibility() {
    _visibility = !_visibility;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _loginIsLoading = true;
    notifyListeners();
    final Result<TokenModel> result = await _authService.login(email, password);

    switch(result){
      case Ok<TokenModel>():
        print(result.value);
        _loginIsLoading = false;
        notifyListeners();
        return true;
      case Error<TokenModel>():
        print(result.error);
        _loginIsLoading = false;
        notifyListeners();
        return false;
    }
  }
}
