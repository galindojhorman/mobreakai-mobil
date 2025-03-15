import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/base_screen.dart';
import '../utils/navigation.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SingleChildScrollView(
        // Envolver el contenido en un SingleChildScrollView
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
                  "Registro de usuario",
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
                      CustomTextField(
                        label: "Nombre",
                        hint: "Ingrese el nombre",
                      ),
                      const SizedBox(height: 53),
                      CustomTextField(
                        label: "Correo",
                        hint: "Ingrese su correo",
                      ),
                      const SizedBox(height: 53),
                      CustomTextField(
                        label: "Contraseña",
                        hint: "Ingrese su contraseña",
                        isPassword: true,
                      ),
                      const SizedBox(height: 53),
                      CustomTextField(
                        label: "Repetir contraseña",
                        hint: "Confirma la contraseña",
                        isPassword: true,
                      ),
                      const SizedBox(height: 41),
                      CustomButton(
                        text: "Registrarse",
                        onPressed: () {
                          _showConfirmationDialog(context);
                        },
                      ),
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          navigateWithAnimation(context, const LoginScreen());
                        },
                        child: Text(
                          "Ir a Login",
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

Future<void> _showConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.dialog,
        title: const Text(
          '¡Registro exitoso!',
          style: TextStyle(color: AppColors.main, fontSize: 24),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                'Se ha registrado de forma exitosa',
                style: TextStyle(color: AppColors.main),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cerrar'),
            onPressed: () {
              navigateWithAnimation(context, const LoginScreen());
            },
          ),
        ],
      );
    },
  );
}