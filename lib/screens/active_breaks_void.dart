import 'package:flutter/material.dart';
import 'package:mobreakai/utils/colors.dart';
import '../utils/navigation.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_app_bar.dart';
import 'create_break.dart';

class ActiveBreaksVoidScreen extends StatelessWidget {
  const ActiveBreaksVoidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BaseScreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 47),
            const Text(
              "Pausas activas",
              style: TextStyle(fontSize: 24, color: AppColors.main),
            ),
            const SizedBox(height: 150),
            const Text(
              "No se encontraron pausas\nactivas",
              style: TextStyle(fontSize: 16, color: AppColors.main),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/void.png', height: 200),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateWithAnimation(context, const ActiveBreaksConfigScreen1());
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: AppColors.main),
      ),
    );
  }
}