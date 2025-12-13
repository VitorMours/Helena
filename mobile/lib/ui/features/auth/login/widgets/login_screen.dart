import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:helena_app/ui/core/ui/widgets/FormInput.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
                  "Sua nova forma, de progredir",
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
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18),
                      ),
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
