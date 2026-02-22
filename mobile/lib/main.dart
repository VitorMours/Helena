import 'package:flutter/material.dart';
import 'package:helena_app/services/auth_service.dart'; // Importe seu serviço
import 'package:helena_app/utils/routes.dart';
import 'package:helena_app/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [Provider<AuthService>(create: (_) => AuthService())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      routerConfig: router,
      theme: AppTheme.lightTheme,
    );
  }
}
