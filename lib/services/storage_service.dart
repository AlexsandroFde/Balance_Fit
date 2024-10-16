import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/calculo_model.dart';

Future<void> salvarUltimoCalculo(CalculoModel dados) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('ultimoCalculo', jsonEncode(dados.toMap()));
}

Future<CalculoModel?> obterUltimoCalculo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? json = prefs.getString('ultimoCalculo');
  return json != null ? CalculoModel.fromMap(jsonDecode(json)) : null;
}

Future<void> limparHistorico() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('ultimoCalculo');
}
