import 'package:balance_fit/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../services/calculation_service.dart';
import '../../services/storage_service.dart';
import '../../models/calculation_model.dart';
import 'components/home_app_bar.dart';
import 'components/calculate_button.dart';
import 'components/home_title.dart';
import 'components/input_fields.dart';
import 'utils/form_callbacks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();
  String gender = 'Masculino';
  String activityLevel = 'Sedentário';
  String objective = 'Perda de peso';

  void calculate() {
    final weight = double.parse(weightController.text);
    final height = double.parse(heightController.text);
    final age = int.parse(ageController.text);
    final tmb = calculateTMB(weight, height, age, gender);
    final calories = calculateDailyCalories(tmb, activityLevel, objective);

    final calculation = CalculationModel(
      weight: weight,
      height: height,
      age: age,
      gender: gender,
      activityLevel: activityLevel,
      objective: objective,
      dailyCalories: calories,
    );

    saveLastCalculation(calculation);
    Navigator.pushNamed(context, '/resultado', arguments: calculation);
  }

  @override
  Widget build(BuildContext context) {
    final formCallbacks = FormCallbacks(
      onGenderChanged: (value) {
        setState(() {
          gender = value;
        });
      },
      onActivityLevelChanged: (value) {
        setState(() {
          activityLevel = value!;
        });
      },
      onObjectiveChanged: (value) {
        setState(() {
          objective = value;
        });
      },
    );

    return Scaffold(
      appBar: const HomeAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const HomeTitle(),
              const SizedBox(height: 20),
              HomeInputFields(
                pesoController: weightController,
                alturaController: heightController,
                idadeController: ageController,
                genero: gender,
                nivelAtividade: activityLevel,
                objetivo: objective,
                formCallbacks: formCallbacks,
              ),
              const SizedBox(height: 10),
              HomeCalculateButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  calculate();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}