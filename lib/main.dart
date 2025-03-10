import 'package:flutter/material.dart';
import 'screens/active_breaks.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/active-breaks-list": (context) => const ActiveBreaksListScreen(),
        // Exponer las demás rutas aquí
      },
    );
  }
}