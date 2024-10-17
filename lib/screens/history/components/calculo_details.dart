import 'package:flutter/material.dart';
import '../../../models/calculation_model.dart';
import '../../../widgets/custom_row.dart';

class CalculoDetails extends StatelessWidget {
  final CalculationModel calculation;

  const CalculoDetails({Key? key, required this.calculation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRow(label: 'Peso', value: '${calculation.weight} kg'),
        CustomRow(label: 'Altura', value: '${calculation.height} cm'),
        CustomRow(label: 'Idade', value: '${calculation.age} anos'),
        CustomRow(label: 'Gênero', value: calculation.gender),
        CustomRow(label: 'Nível de Atividade', value: calculation.activityLevel),
        CustomRow(label: 'Objetivo', value: calculation.objective),
        const SizedBox(height: 10),
        const Align(
          child: Text(
            'Calorias Diárias Recomendadas:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            '${calculation.dailyCalories.toStringAsFixed(2)} kcal',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }
}