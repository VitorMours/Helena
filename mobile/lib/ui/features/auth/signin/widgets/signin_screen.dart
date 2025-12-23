import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:helena_app/ui/core/ui/widgets/FormInput.dart";
import "../../../../../utils/theme.dart";

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    // Nota: Chaves e Controllers devem idealmente estar em um StatefulWidget
    // ou gerenciador de estado para persistirem durante reconstruções.
    final signinFormKey = GlobalKey<FormState>();

    return Scaffold(
      // SafeArea evita que o conteúdo fique sob a barra de status ou "notch"
      body: SafeArea(
        child: SingleChildScrollView( // Permite scroll se o teclado aparecer
          child: Container(
            constraints: BoxConstraints(
              // Garante que o conteúdo ocupe ao menos a altura da tela
              minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
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
                        const FormInput("credentials"),
                        const Gap(24),
                        // Correção da Row: Widgets de input precisam de Expanded para dividir o espaço
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: const FormInput("password"),
                            ),
                            const Gap(12), // Espaço entre os campos de senha
                            Expanded(
                              child: const FormInput("retype your password"),
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
                              // Adicione a lógica de validação aqui
                              if (signinFormKey.currentState?.validate() ?? false) {
                                // Lógica de registro
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