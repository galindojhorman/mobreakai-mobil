import 'package:flutter/material.dart';
import 'package:mobreakai/utils/colors.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_app_bar.dart';

class ActiveBreaksListScreen extends StatelessWidget {
  const ActiveBreaksListScreen({super.key});

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
            const SizedBox(height: 34),
            const Text(
              "Jornada: 8am - 5pm",
              style: TextStyle(fontSize: 20, color: AppColors.main),
            ),
            const SizedBox(height: 52),

            // Lista de pausas activas
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 30),
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
                  _buildBreakItem("08:30 am", "Manos", true),
                  _buildBreakItem("11:30 am", "Piernas", true),
                  _buildBreakItem("03:00 pm", "Espalda", false),
                  _buildBreakItem("04:30 pm", "Hombros", null),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Objetivos
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 30),
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
                children: const [
                  Text(
                    "Objetivos",
                    style: TextStyle(fontSize: 20, color: AppColors.main),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Hoy                               2 / 4",
                    style: TextStyle(fontSize: 20, color: AppColors.main),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),

            // Botón de remover pausas activas
            TextButton.icon(
              onPressed: () {
                // Acción para eliminar pausas
              },
              icon: const Icon(Icons.delete, color: Colors.red),
              label: const Text(
                "Remover pausas activas",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakItem(String time, String bodyPart, bool? completed) {
    return ListTile(
      leading: Text(
        time,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.main,
        ),
      ),

      title: Row(
        children: [
          Spacer(),
          Text(
            bodyPart,
            style: const TextStyle(fontSize: 20, color: AppColors.main),
          ),
        ],
      ),
      trailing:
          completed == null
              ? const Icon(Icons.access_time, color: Colors.grey) // Pendiente
              : completed
              ? const Icon(Icons.check_circle, color: Colors.green) // Hecho
              : const Icon(Icons.cancel, color: Colors.red), // No hecho
    );
  }
}
