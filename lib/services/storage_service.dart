import 'package:shared_preferences/shared_preferences.dart';
import '../models/calculo_model.dart';

Future<void> salvarUltimoCalculo(CalculoModel calculo) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('ultimoCalculo', calculo.toJson());
}

Future<CalculoModel?> obterUltimoCalculo() async {
  final prefs = await SharedPreferences.getInstance();
  final String? jsonString = prefs.getString('ultimoCalculo');
  if (jsonString != null) {
    return CalculoModel.fromJson(jsonString);
  }
  return null;
}

Future<void> limparHistorico() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('ultimoCalculo');
}