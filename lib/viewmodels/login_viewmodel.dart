import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../services/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  Future<bool> login() async {
    if (!formKey.currentState!.validate()) return false;

    _isBusy = true;
    notifyListeners();

    bool result = await _authService.login(
      emailController.text,
      passwordController.text,
    );

    _isBusy = false;
    notifyListeners();

    return result;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
