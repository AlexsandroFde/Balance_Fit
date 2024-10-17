import 'package:flutter/material.dart';
import '../../../models/calculation_model.dart';
import '../../../widgets/custom_row.dart';

class CalculationDetails extends StatelessWidget {
  final CalculationModel calculation;

  const CalculationDetails({Key? key, required this.calculation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRow(label: 'Peso', value: '${calculation.weight} kg'),
        CustomRow(label: 'Altura', value: '${calculation.height} cm'),
        CustomRow(label: 'Idade', value: '${calculation.age} anos'),
        CustomRow(label: 'Gênero', value: calculation.gender),
        CustomRow(label: 'Nível de Atividade', value: calculation.activityLevel),
        CustomRow(label: 'Objetivo', value: calculation.objective),
      ],
    );
  }
}
