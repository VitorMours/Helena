import 'package:flutter/material.dart';
import 'package:helena_app/models/authModels.dart';
import 'package:helena_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPageViewModel extends ChangeNotifier {
  final AuthService _authService;
  Icon suffixIcon = Icon(Icons.visibility_off);
  bool _loginIsLoading = false;
  bool _visibility = false;
  String _errorMessage = "";

  LoginPageViewModel({required AuthService authService})
    : _authService = authService;

  bool get visibility => _visibility;
  bool get loginIsLoading => _loginIsLoading;
  void toggleVisibility() {
    _visibility = !_visibility;
    notifyListeners();
  }

  // TODO: Precisa corrigir para adicionar correcao ao errar a senha
  Future<bool> login(String email, String password) async {
    _loginIsLoading = true;
    notifyListeners();
    try {
      final TokenModel response = await _authService.login(email, password);
      _loginIsLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _loginIsLoading = false;
      _errorMessage = "Falha ao entrar. Verifique suas credenciais.";
      notifyListeners();
      return false;
    }
  }
}
