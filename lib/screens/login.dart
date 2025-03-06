
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 85),
              Image.asset("assets/images/logo.png", height: 100),
              const SizedBox(height: 33),
              Text(
                "Iniciar sesión",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.main,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.alternate,
                      blurRadius: 16,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    CustomTextField(label: "Correo", hint: "Ingrese su correo"),
                    const SizedBox(height: 40),
                    CustomTextField(
                      label: "Contraseña",
                      hint: "Ingrese su contraseña",
                      isPassword: true,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Recuperar contraseña",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.main,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 71),
                    CustomButton(
                      text: "Iniciar sesión",
                      onPressed: () {
                        Navigator.pushNamed(context, '/active-breaks-list');
                      },
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Registrarse",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.main,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}