import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class ActiveBreaksListScreen extends StatelessWidget {
  const ActiveBreaksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}