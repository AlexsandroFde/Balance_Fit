import 'package:flutter/material.dart';
import '../services/calculation_service.dart';
import '../services/storage_service.dart';
import '../models/calculo_model.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gender_selector.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final idadeController = TextEditingController();
  String genero = 'Masculino';
  String nivelAtividade = 'Sedentário';
  String objetivo = 'Perda de peso';

  void calcular() {
    final peso = double.parse(pesoController.text);
    final altura = double.parse(alturaController.text);
    final idade = int.parse(idadeController.text);
    final tmb = calcularTMB(peso, altura, idade, genero);
    final calorias = calcularCaloriasDiarias(tmb, nivelAtividade, objetivo);

    final calculo = CalculoModel(
      peso: peso,
      altura: altura,
      idade: idade,
      genero: genero,
      nivelAtividade: nivelAtividade,
      objetivo: objetivo,
      caloriasDiarias: calorias,
    );

    salvarUltimoCalculo(calculo);
    Navigator.pushNamed(context, '/resultado', arguments: calculo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Calorias'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/historico');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue[50]!, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Usar um Form para validação
          child: ListView(
            children: [
              Text(
                'Calcule suas Calorias Diárias',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Peso:',
                      hintText: 'Ex: 73.5',
                      controller: pesoController,
                      suffixText: 'kg',
                      validator: (value) {
                        setState(() {});
                        if (value == null || value.isEmpty) {
                          return 'Insira seu peso'; // Validação de exemplo
                        }
                        // Validação para verificar se o peso é um número válido
                        final number = double.tryParse(value.replaceAll(',', '.'));
                        if (number == null || number <= 0) {
                          return 'Insira um peso válido'; // Mensagem de erro
                        }
                        return null; // Retorna null se a validação passar
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Altura:',
                      hintText: 'Ex: 178',
                      controller: alturaController,
                      suffixText: 'cm',
                      validator: (value) {
                        setState(() {});
                        if (value == null || value.isEmpty) {
                          return 'Insira sua altura'; // Validação de exemplo
                        }
                        // Validação para verificar se o peso é um número válido
                        final number = double.tryParse(value.replaceAll(',', '.'));
                        if (number == null || number <= 0) {
                          return 'Insira uma altura válida'; // Mensagem de erro
                        }
                        return null; // Retorna null se a validação passar
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Idade:',
                      hintText: 'Ex: 32',
                      controller: idadeController,
                      suffixText: 'anos',
                      validator: (value) {
                        setState(() {});
                        if (value == null || value.isEmpty) {
                          return 'Insira sua idade'; // Validação de exemplo
                        }
                        // Validação para verificar se a idade é um número válido
                        final number = int.tryParse(value);
                        if (number == null || number <= 0) {
                          return 'Insira uma idade válida'; // Mensagem de erro
                        }
                        return null; // Retorna null se a validação passar
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GenderSelector(
                      selectedGender: genero,
                      onGenderChanged: (newGender) {
                        setState(() {
                          genero = newGender;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              DropdownButtonFormField(
                value: nivelAtividade,
                items: ['Sedentário', 'Levemente ativo', 'Moderadamente ativo', 'Muito ativo'].map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    nivelAtividade = newValue.toString();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Nível de Atividade',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                value: objetivo,
                items: ['Perda de peso', 'Ganho de peso'].map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    objetivo = newValue.toString();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Objetivo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    calcular();
                  }
                },
                child: Text('Calcular Calorias'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  primary: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
