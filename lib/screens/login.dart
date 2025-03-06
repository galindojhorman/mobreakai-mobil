import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/shared.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 85),
            Image.asset("assets/images/logo.png", height: 100),
            SizedBox(height: 33),
            Text(
              "Iniciar sesión",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.main,
              ),
            ),
            SizedBox(height: 50),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.alternate,
                    blurRadius: 16,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),

                  // Campo de Correo
                  CustomTextField(label: "Correo", hint: "Ingrese su correo"),

                  SizedBox(height: 40),

                  // Campo de Contraseña
                  CustomTextField(
                    label: "Contraseña",
                    hint: "Ingrese su contraseña",
                    isPassword: true,
                  ),

                  SizedBox(height: 10),

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

                  SizedBox(height: 71),

                  // Botón de Iniciar sesión
                  CustomButton(
                    text: "Iniciar sesión",
                    onPressed: () {},
                  ),

                  SizedBox(height: 30),

                  // Registrarse
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
    );
  }
}