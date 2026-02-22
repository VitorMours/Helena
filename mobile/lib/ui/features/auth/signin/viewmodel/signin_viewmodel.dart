import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SigninPageViewModel extends ChangeNotifier {
  Icon passwordVisibilitysuffixIcon = Icon(Icons.visibility_off);
  Icon retypePasswordVisibilitysuffixIcon = Icon(Icons.visibility_off);
  bool _passwordVisibility = false;
  bool _retypePasswordVisibility = false;
  bool _signinIsLoading = false;

  SigninPageViewModel();

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

  void signin() {}
}
