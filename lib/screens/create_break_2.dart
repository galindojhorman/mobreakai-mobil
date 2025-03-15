import 'package:flutter/material.dart';
import 'package:mobreakai/utils/colors.dart';
import '../utils/navigation.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_app_bar.dart';
import 'active_breaks.dart';
import 'create_break.dart';

class ActiveBreaksConfigScreen2 extends StatefulWidget {
  const ActiveBreaksConfigScreen2({super.key});

  @override
  _ActiveBreaksConfigScreen2State createState() =>
      _ActiveBreaksConfigScreen2State();
}

class _ActiveBreaksConfigScreen2State extends State<ActiveBreaksConfigScreen2> {
  Set<String> selectedDays = {};
  Set<String> selectedExercises = {};

  void _toggleDaySelection(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
  }

  void _toggleExerciseSelection(String exercise) {
    setState(() {
      if (selectedExercises.contains(exercise)) {
        selectedExercises.remove(exercise);
      } else {
        selectedExercises.add(exercise);
      }
    });
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
                "Tipos de ejercicios a realizar",
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
                        navigateWithAnimation(
                          context,
                          const ActiveBreaksConfigScreen1(),
                        );
                      },
                      isSelected: false,
                    ),
                    _buildOption(
                      icon: Icons.list,
                      text: "2. Cantidad de pausas",
                      onTap: () {},
                      isSelected: true,
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
                      "Numero de alarmas al día",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.alternate,
                      ),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDayOption("1"),
                        _buildDayOption("2"),
                        _buildDayOption("3"),
                        _buildDayOption("4"),
                        _buildDayOption("5"),
                      ],
                    ),
                    const SizedBox(height: 35),
                    const Text(
                      "Ejercicios",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.alternate,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Container(
                      height: 233,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.alternate,
                          width: 1.0,
                        ),
                      ),
                      child: GridView.builder(
                        itemCount: 8,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 3, // Ajusta la proporción aquí
                            ),
                        itemBuilder: (context, index) {
                          final exercises = [
                            "Manos",
                            "Piernas",
                            "Brazos",
                            "Hombros",
                            "Ojos",
                            "Espalda",
                            "Cabeza",
                            "Codos",
                          ];
                          return _buildExerciseOption(exercises[index]);
                        },
                      ),
                    ),
                    const SizedBox(height: 60),
                    CustomButtonRow(
                      text1: "Volver",
                      onPressed1: () {
                        Navigator.pop(context);
                      },
                      text2: "Crear",
                      onPressed2: () {
                        _showConfirmationDialog(context);
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 47),
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

  Widget _buildExerciseOption(String exercise) {
    bool isSelected = selectedExercises.contains(exercise);

    return GestureDetector(
      onTap: () => _toggleExerciseSelection(exercise),
      child: Container(
        height: 50, // Ajusta la altura aquí
        decoration: BoxDecoration(
          color: isSelected ? AppColors.highlight : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.alternate, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (bool? value) {
                _toggleExerciseSelection(exercise);
              },
              activeColor: Colors.white,
              checkColor: AppColors.highlight,
            ),
            Text(
              exercise,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.main,
              ),
            ),
          ],
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
              minimumSize: Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: AppColors.main, width: 1),
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
              minimumSize: Size(double.infinity, 40),
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
                'Se han registrado las pausas activas de forma exitosa',
                style: TextStyle(color: AppColors.main),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cerrar'),
            onPressed: () {
              navigateWithAnimation(context, const ActiveBreaksListScreen());
            },
          ),
        ],
      );
    },
  );
}