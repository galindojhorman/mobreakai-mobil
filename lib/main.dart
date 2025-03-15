import 'package:flutter/material.dart';
import 'package:mobreakai/screens/register.dart';
import 'screens/active_breaks.dart';
import 'screens/create_break.dart';
import 'screens/login.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme, 
      initialRoute: "/create-break",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/active-breaks-list": (context) => const ActiveBreaksListScreen(),
        "/create-break": (context) => const ActiveBreaksConfigScreen(),
        "/register": (context) => const RegisterScreen(),
        // Exponer las demás rutas aquí
      },
    );
  }
}