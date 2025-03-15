import 'package:flutter/material.dart';
import 'package:mobreakai/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.main),
      obscureText: widget.isPassword ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint, // Agregar el hintText aquí
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
      ),
    );
  }
}