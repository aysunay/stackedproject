import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedproject/ui/common/app_colors.dart';
import 'package:stackedproject/ui/views/login/login_viewmodel.dart';

import '../../common/ui_helpers.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcwhite,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 350,
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Sign In', style: TextStyle(fontSize: 20)),
                      verticalSpaceSmall,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          controller: viewModel.emailController,
                          decoration: const InputDecoration(
                            labelText: 'Enter your email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'E-posta zorunlu!';
                            }
                            return null;
                          },
                        ),
                      ),
                      verticalSpaceMedium,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              controller: viewModel.passwordController,
                              obscureText: viewModel.obscurePassword,
                              decoration: InputDecoration(
                                labelText: 'Enter your password',
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    viewModel.obscurePassword ? Icons.visibility_off : Icons.visibility,
                                  ),
                                  onPressed: viewModel.toggleObscurePassword,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Şifre zorunlu';
                                }
                                return null;
                              },
                            ),
                            verticalSpaceTiny,
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Forgot password?",
                                style: TextStyle(
                                  color: kcred,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpaceMedium,
                      if (viewModel.isBusy)
                        const CircularProgressIndicator()
                      else ...[
                        fixedSizeBox(
                          child: ElevatedButton(
                            onPressed: () async => await viewModel.login(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kcred,
                              foregroundColor: kcwhite,
                            ),
                            child: const Text('Login'),
                          ),
                        ),
                        verticalSpaceMedium,
                        fixedSizeBox(
                          child: ElevatedButton(
                            onPressed: viewModel.isBusy ? null : () async => await viewModel.register(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kcred,
                              foregroundColor: kcwhite,
                            ),
                            child: const Text('Sign Up'),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
