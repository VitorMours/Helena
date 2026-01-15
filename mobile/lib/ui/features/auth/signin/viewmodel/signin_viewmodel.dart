import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SigninPageViewModel extends ChangeNotifier {
  Icon passwordVisibilitysuffixIcon = Icon(Icons.visibility_off);
  Icon retypePasswordVisibilitysuffixIcon = Icon(Icons.visibility_off);

  SigninPageViewModel();

  bool _passwordVisibility = false;
  bool _retypePasswordVisibility = false;

  bool get passwordVisibility => _passwordVisibility;
  bool get retypePasswordVisibility => _retypePasswordVisibility;

  void togglePasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  void toggleRetypePasswordVisibility() {
    _retypePasswordVisibility = !_retypePasswordVisibility;
    notifyListeners();
  }
}
