import 'package:balance_fit/screens/result/components/result_title.dart';
import 'package:flutter/material.dart';
import '../../models/calculation_model.dart';
import 'components/calculation_details.dart';
import 'components/daily_calories_display.dart';
import 'components/result_app_bar.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CalculationModel calculation = ModalRoute.of(context)!.settings.arguments as CalculationModel;

    return Scaffold(
      appBar: const ResultAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[50]!, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const ResultTitle(),
            const SizedBox(height: 20),
            Text(
              'Para atingir seu objetivo de ${calculation.objective.toLowerCase()}, você deve consumir aproximadamente:',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            DailyCaloriesDisplay(calories: calculation.dailyCalories),
            const SizedBox(height: 20),
            const Text(
              'Detalhes do Cálculo:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 10),
            CalculationDetails(calculation: calculation),
          ],
        ),
      ),
    );
  }
}
