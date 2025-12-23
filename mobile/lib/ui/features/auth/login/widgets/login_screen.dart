import "dart:io";

import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:helena_app/ui/core/ui/widgets/FormInput.dart";
import "package:helena_app/utils/theme.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 25.0,
              ),
              child: Column(
                spacing: 24,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FormInput("credentials"),
                  FormInput("password"),
                  SizedBox(
                    width: width,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => context.push("/signin"),
                        child: const Text("Don't have a account? Create one", style: TextStyle(decoration:TextDecoration.underline, color: AppTheme.linkColor)),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                      ),
                      child: const Text("Login", style: const TextStyle(fontSize: 20)),
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
