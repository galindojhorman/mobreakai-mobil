import 'package:flutter/material.dart';
import 'screens/active_breaks.dart';
import 'screens/active_breaks_void.dart';
import 'screens/create_break.dart';
import 'screens/create_break_2.dart';
import 'screens/login.dart';
import 'screens/register.dart';
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
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/active-breaks-list": (context) => const ActiveBreaksListScreen(),
        "/create-break-1": (context) => const ActiveBreaksConfigScreen1(),
        "/create-break-2": (context) => const ActiveBreaksConfigScreen2(),
        "/register": (context) => const RegisterScreen(),
        "/active-breaks-void": (context) => const ActiveBreaksVoidScreen(),
      },
    );
  }
}