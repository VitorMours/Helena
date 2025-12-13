import 'package:flutter/material.dart';
import 'package:helena_app/utils/routes.dart';
import 'package:helena_app/utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router, theme: AppTheme.lightTheme);
  }
}
