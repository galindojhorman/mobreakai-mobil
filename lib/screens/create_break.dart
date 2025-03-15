import 'package:flutter/material.dart';
import 'package:mobreakai/utils/colors.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_app_bar.dart';

class ActiveBreaksConfigScreen extends StatefulWidget {
  const ActiveBreaksConfigScreen({super.key});

  @override
  _ActiveBreaksConfigScreenState createState() =>
      _ActiveBreaksConfigScreenState();
}

class _ActiveBreaksConfigScreenState extends State<ActiveBreaksConfigScreen> {
  Set<String> selectedDays = {}; // Set para almacenar los días seleccionados
  TimeOfDay startTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay endTime = TimeOfDay(hour: 8, minute: 0);

  void _toggleDaySelection(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime : endTime,
    );
    if (picked != null && picked != (isStartTime ? startTime : endTime)) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BaseScreen(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 47),
              const Text(
                "Crear pausa activa",
                style: TextStyle(fontSize: 24, color: AppColors.main),
              ),
              const SizedBox(height: 14),
              const Text(
                "¿Cuál es tu jornada laboral?",
                style: TextStyle(fontSize: 15, color: AppColors.alternate),
              ),
              const SizedBox(height: 52),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildOption(
                      icon: Icons.access_time,
                      text: "1. Horario de pausas",
                      onTap: () {
                        // Acción para el botón "Horario de pausas"
                      },
                      isSelected: true,
                    ),
                    _buildOption(
                      icon: Icons.list,
                      text: "2. Cantidad de pausas",
                      onTap: () {
                        // Acción para el botón "Cantidad de pausas"
                      },
                      isSelected: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 21),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
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
                    const Text(
                      "Días de la semana",
                      style: TextStyle(fontSize: 15, color: AppColors.alternate),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDayOption("Lu"),
                        _buildDayOption("Ma"),
                        _buildDayOption("Mi"),
                        _buildDayOption("Ju"),
                        _buildDayOption("Vi"),
                        _buildDayOption("Sa"),
                        _buildDayOption("Do"),
                      ],
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      "Hora de inicio",
                      style: TextStyle(fontSize: 15, color: AppColors.alternate),
                    ),
                    TimePickerContainer(
                      time: startTime,
                      onTap: () => _selectTime(context, true),
                    ),
                    const Text(
                      "Hora de fin",
                      style: TextStyle(fontSize: 15, color: AppColors.alternate),
                    ),
                    TimePickerContainer(
                      time: endTime,
                      onTap: () => _selectTime(context, false),
                    ),
                    const SizedBox(height: 20),
                    CustomButtonRow(
                      text1: "Volver",
                      onPressed1: () {
                        Navigator.pop(context);
                      },
                      text2: "Continuar",
                      onPressed2: () {
                        // TODO:  Acción para el botón "Continuar"
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 32,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.highlight : Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Icon(icon, color: AppColors.main)),
          ),
          Text(text, style: TextStyle(fontSize: 12, color: AppColors.main)),
        ],
      ),
    );
  }

  Widget _buildDayOption(String day) {
    bool isSelected = selectedDays.contains(day);

    return GestureDetector(
      onTap: () => _toggleDaySelection(day),
      child: Container(
        width: 40,
        height: 47,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.highlight : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.alternate, width: 1.0),
        ),
        child: Center(
          child: Text(day, style: TextStyle(color: AppColors.main)),
        ),
      ),
    );
  }
}

class TimePickerContainer extends StatelessWidget {
  final TimeOfDay time;
  final VoidCallback onTap;

  const TimePickerContainer({Key? key, required this.time, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.neutral,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.alternate, width: 1.0),
        ),
        child: Text(
          "${time.format(context)}",
          style: TextStyle(fontSize: 24, color: AppColors.main),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CustomButtonRow extends StatelessWidget {
  final String text1;
  final VoidCallback onPressed1;
  final String text2;
  final VoidCallback onPressed2;

  const CustomButtonRow({
    Key? key,
    required this.text1,
    required this.onPressed1,
    required this.text2,
    required this.onPressed2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: AppColors.main, width: 2),
              ),
            ),
            onPressed: onPressed1,
            child: Text(
              text1,
              style: TextStyle(color: AppColors.main, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.main,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: onPressed2,
            child: Text(
              text2,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}