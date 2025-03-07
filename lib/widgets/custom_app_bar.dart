import 'package:flutter/material.dart';
import 'package:mobreakai/screens/login.dart';
import '../utils/colors.dart';
import '../utils/navigation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("Mobreak Ai", style: TextStyle(color: AppColors.main)),
      backgroundColor: AppColors.banner,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: AppColors.main),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.logout, color: AppColors.main),
          onPressed: () {
            navigateWithAnimation(context, const LoginScreen());
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
