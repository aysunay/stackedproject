import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 50),
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Form(
            key: viewModel.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Sign In', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
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
                const SizedBox(height: 30),
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
                              viewModel.obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                if (viewModel.isBusy)
                  const CircularProgressIndicator()
                else ...[
                  SizedBox(
                    width: 145,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool loginSuccess = await viewModel.login();
                        if (loginSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Login Successful'),
                              backgroundColor: Colors.pinkAccent,
                              duration: Duration(seconds: 3),
                            ),
                          );
                          await Future.delayed(const Duration(seconds: 1));
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const BlankScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('E-posta veya şifre yanlış!')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 145,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: viewModel.isBusy ? null : () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
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
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}

class BlankScreen extends StatelessWidget {
  const BlankScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Boş Sayfa')),
    );
  }
}
