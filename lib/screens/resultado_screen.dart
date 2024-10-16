import 'package:flutter/material.dart';
import '../models/calculo_model.dart';

class ResultadoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalculoModel calculo = ModalRoute.of(context)!.settings.arguments as CalculoModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado das Calorias Diárias'),
      ),
      body: Container(
        color: Colors.lightBlue[50], // Cor de fundo suave
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Adicionando SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Calorias Diárias Recomendadas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              SizedBox(height: 20),
              Text(
                'Para atingir seu objetivo de ${calculo.objetivo.toLowerCase()}, você deve consumir aproximadamente:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  '${calculo.caloriasDiarias.toStringAsFixed(2)} kcal',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Detalhes do Cálculo:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildDetailRow('Peso', '${calculo.peso} kg'),
              _buildDetailRow('Altura', '${calculo.altura} cm'),
              _buildDetailRow('Idade', '${calculo.idade} anos'),
              _buildDetailRow('Gênero', calculo.genero),
              _buildDetailRow('Nível de Atividade', calculo.nivelAtividade),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 18)),
          Text(value, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
