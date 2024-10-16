import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../models/calculo_model.dart';

class HistoricoScreen extends StatefulWidget {
  @override
  _HistoricoScreenState createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  CalculoModel? ultimoCalculo;

  @override
  void initState() {
    super.initState();
    carregarUltimoCalculo();
  }

  Future<void> carregarUltimoCalculo() async {
    CalculoModel? calculo = await obterUltimoCalculo();
    setState(() {
      ultimoCalculo = calculo;
    });
  }

  void lmprHstrc() async {
    await limparHistorico();
    setState(() {
      ultimoCalculo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico do Último Cálculo'),
      ),
      body: Container(
        color: Colors.lightBlue[50], // Cor de fundo suave
        padding: EdgeInsets.all(16.0),
        child: ultimoCalculo == null
            ? Center(child: Text('Nenhum cálculo salvo.'))
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Último Cálculo Realizado',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 20),
            _buildDetailRow('Peso', '${ultimoCalculo!.peso} kg'),
            _buildDetailRow('Altura', '${ultimoCalculo!.altura} cm'),
            _buildDetailRow('Idade', '${ultimoCalculo!.idade} anos'),
            _buildDetailRow('Gênero', '${ultimoCalculo!.genero}'),
            _buildDetailRow('Nível de Atividade', '${ultimoCalculo!.nivelAtividade}'),
            _buildDetailRow('Objetivo', '${ultimoCalculo!.objetivo}'),
            SizedBox(height: 20),
            Text(
              'Calorias Diárias Recomendadas:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                '${ultimoCalculo!.caloriasDiarias.toStringAsFixed(2)} kcal',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: lmprHstrc,
              child: Text('Limpar Histórico'),
            ),
          ],
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
