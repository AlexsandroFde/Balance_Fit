import 'package:flutter/material.dart';
import '../../../widgets/custom_dropdown_field.dart';
import '../../../widgets/custom_selector.dart';
import '../../../widgets/custom_text_field.dart';
import '../utils/form_callbacks.dart';
import '../utils/form_validators.dart';

class HomeInputFields extends StatelessWidget {
  final TextEditingController pesoController;
  final TextEditingController alturaController;
  final TextEditingController idadeController;
  final String genero;
  final String nivelAtividade;
  final String objetivo;
  final FormCallbacks formCallbacks;

  const HomeInputFields({
    Key? key,
    required this.pesoController,
    required this.alturaController,
    required this.idadeController,
    required this.genero,
    required this.nivelAtividade,
    required this.objetivo,
    required this.formCallbacks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                labelText: 'Peso:',
                hintText: 'Ex: 73.5',
                controller: pesoController,
                suffixText: 'kg',
                validator: FormValidators.validatePeso,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomTextField(
                labelText: 'Altura:',
                hintText: 'Ex: 178',
                controller: alturaController,
                suffixText: 'cm',
                validator: FormValidators.validateAltura,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                labelText: 'Idade:',
                hintText: 'Ex: 32',
                controller: idadeController,
                suffixText: 'anos',
                validator: FormValidators.validateIdade,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomSelector(
                labelText: 'Gênero:',
                items: const ['Masculino', 'Feminino'],
                onChanged: formCallbacks.changeGenero,
                selectedValue: genero,
                itemIcons: const {
                  'Masculino': IconData(0xf0538, fontFamily: 'MaterialIcons'),
                  'Feminino': IconData(0xf05ab, fontFamily: 'MaterialIcons'),
                },
              ),
            ),
          ],
        ),
        CustomDropdownField(
          labelText: 'Nível de Atividade:',
          value: nivelAtividade,
          items: const ['Sedentário', 'Levemente ativo', 'Moderadamente ativo', 'Muito ativo'],
          onChanged: formCallbacks.changeNivelAtividade,
        ),
        CustomSelector<String>(
          labelText: 'Objetivo:',
          selectedValue: objetivo,
          items: const ['Perda de peso', 'Ganho de peso'],
          onChanged: formCallbacks.changeObjetivo,
        ),
      ],
    );
  }
}