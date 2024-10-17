import 'package:shared_preferences/shared_preferences.dart';
import '../models/calculation_model.dart';

Future<void> saveLastCalculation(CalculationModel calculation) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('ultimoCalculo', calculation.toJson());
}

Future<CalculationModel?> getLastCalculation() async {
  final prefs = await SharedPreferences.getInstance();
  final String? jsonString = prefs.getString('ultimoCalculo');
  if (jsonString != null) {
    return CalculationModel.fromJson(jsonString);
  }
  return null;
}

Future<void> clearHistory() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('ultimoCalculo');
}