import 'package:flutter/material.dart';

class DailyCaloriesDisplay extends StatelessWidget {
  final double calories;

  const DailyCaloriesDisplay({Key? key, required this.calories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${calories.toStringAsFixed(2)} kcal',
        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blueAccent),
      ),
    );
  }
}
