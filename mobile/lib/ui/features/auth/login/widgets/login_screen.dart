import "dart:io";

import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:helena_app/ui/core/ui/widgets/FormInput.dart";
import "package:helena_app/ui/core/ui/widgets/PasswordInput.dart";
import "package:helena_app/ui/features/auth/login/viewmodel/login_viewmodel.dart";
import "package:helena_app/utils/theme.dart";
import "package:provider/provider.dart";

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginPageViewModel viewModel = context.watch<LoginPageViewModel>();
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        spacing: 30,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  "Helena.",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Your new way to progress",
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 25.0,
              ),
              child: Column(
                spacing: 24,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FormInput(
                    "credentials",
                    controller: emailController,
                    validator: (_) => viewModel.loginError,
                  ),
                  PasswordInput(
                    controller: passwordController,
                    "password",
                    !viewModel.visibility,
                    IconButton(
                      icon: Icon(
                        viewModel.visibility
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => viewModel.toggleVisibility(),
                    ),
                  ),
                  SizedBox(
                    width: width,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => context.push("/signin"),
                        child: const Text(
                          "Don't have a account? Create one",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppTheme.linkColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                      ),
                      child: viewModel.loginIsLoading
                          ? CircularProgressIndicator()
                          : const Text(
                              "Entrar",
                              style: const TextStyle(fontSize: 20),
                            ),
                      onPressed: () async {
                        viewModel.clearError();
                        _formKey.currentState!.validate();

                        if (_formKey.currentState!.validate()) {
                          final success = await viewModel.login(
                            emailController.text,
                            passwordController.text,
                          );

                          if (context.mounted) {
                            if (success) {
                              context.go("/home");
                            } else {
                              _formKey.currentState!.validate();
                            }
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
