import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:helena_app/ui/core/ui/widgets/FormInput.dart";
import "package:helena_app/ui/core/ui/widgets/PasswordInput.dart";
import "package:helena_app/ui/features/auth/signin/viewmodel/signin_viewmodel.dart";
import "package:provider/provider.dart";
import "../../../../../utils/theme.dart";

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final retypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SigninPageViewModel viewModel = context.watch<SigninPageViewModel>();

    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    final signinFormKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: signinFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "Create your account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "and start developing your habits",
                          style: theme.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(35),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FormInput(
                                "first name",
                                controller: firstNameController,
                                validator: () => {}
                              ),
                            ),
                            Gap(12),
                            Expanded(
                              child: FormInput(
                                "last name",
                                controller: lastNameController,
                                validator: () => {}
                              ),
                            ),
                          ],
                        ),
                        const Gap(24),
                        FormInput(controller: emailController, "email",validator: () => {}),
                        const Gap(24),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: PasswordInput(
                                controller: passwordController,
                                "password",
                                !viewModel.passwordVisibility,
                                IconButton(
                                  icon: Icon(
                                    viewModel.passwordVisibility
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () =>
                                      viewModel.togglePasswordVisibility(),
                                ),
                              ),
                            ),
                            const Gap(12),
                            Expanded(
                              child: PasswordInput(
                                controller: retypeController,
                                "retype your password",
                                !viewModel.retypePasswordVisibility,
                                IconButton(
                                  icon: Icon(
                                    viewModel.retypePasswordVisibility
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () => viewModel
                                      .toggleRetypePasswordVisibility(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(24),
                        SizedBox(
                          width: width,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () => context.push("/login"),
                              child: const Text(
                                "Already have a account? Log in",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppTheme.linkColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                            ),
                            onPressed: () {
                              if (signinFormKey.currentState!.validate()) {
                                
                              }
                            },
                            child: const Text(
                              "Create account",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
