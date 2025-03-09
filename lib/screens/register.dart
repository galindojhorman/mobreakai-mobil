import 'package:flutter/material.dart';
import 'package:mobreakai/screens/login.dart';
import 'package:mobreakai/utils/navigation.dart';
import 'package:mobreakai/widgets/base_screen.dart';
import 'package:mobreakai/widgets/custom_button.dart';
import 'package:mobreakai/widgets/custom_text_field.dart';
import '../utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SingleChildScrollView(
            keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior
                    .onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Image.asset("assets/images/logo.png", height: 100),
                const SizedBox(height: 15),
                Text(
                  "Registro de usuario",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.main,
                  ),
                ),
                const SizedBox(height: 30),
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
                      CustomTextField(
                        label: "Nombre",
                        hint: "Ingrese el nombre",
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                        label: "Correo",
                        hint: "Ingrese su correo",
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                        label: "Contraseña",
                        hint: "Ingrese su contraseña",
                        isPassword: true,
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                        label: "Repetir contraseña",
                        hint: "Confirma la contraseña",
                        isPassword: true,
                      ),
                      const SizedBox(height: 50),
                      CustomButton(text: "Registrarse", onPressed: () {}),
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          navigateWithAnimation(context, LoginScreen());
                        },
                        child: Text(
                          "Ir a login",
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
      ),
    );
  }
}
