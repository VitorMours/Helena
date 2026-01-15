import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPageViewModel extends ChangeNotifier {
  Icon suffixIcon = Icon(Icons.visibility_off);

  LoginPageViewModel();

  bool _visibility = false;

  bool get visibility => _visibility;

  void toggleVisibility() {
    _visibility = !_visibility;
    notifyListeners();
  }
}
