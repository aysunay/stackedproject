import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedproject/app/app.locator.dart';
import 'package:stackedproject/app/app.router.dart';
import 'package:stackedproject/services/auth_service.dart';

import '../../../model/auth_models/user_login_model.dart';

class LoginViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    final loginModel = UserLoginModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    bool result = await runBusyFuture(_authService.login(loginModel));

    if (result) {
      _snackbarService.showSnackbar(
        message: 'Login Successful',
        duration: const Duration(seconds: 1),
      );

      _navigationService.replaceWithCardListView();
    } else {
      _snackbarService.showSnackbar(message: 'E-posta veya şifre yanlış!');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
