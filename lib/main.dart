import 'package:flutter/material.dart';
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
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/fondo.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: LoginScreen(), 
        ),
      ),
    );
  }
}
