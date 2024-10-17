import 'dart:convert';

class CalculationModel {
  final double weight;
  final double height;
  final int age;
  final String gender;
  final String activityLevel;
  final String objective;
  final double dailyCalories;

  CalculationModel({
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
    required this.activityLevel,
    required this.objective,
    required this.dailyCalories,
  });

  Map<String, dynamic> toMap() {
    return {
      'peso': weight,
      'altura': height,
      'idade': age,
      'genero': gender,
      'nivelAtividade': activityLevel,
      'objetivo': objective,
      'caloriasDiarias': dailyCalories,
    };
  }

  factory CalculationModel.fromMap(Map<String, dynamic> map) {
    return CalculationModel(
      weight: map['peso'],
      height: map['altura'],
      age: map['idade'],
      gender: map['genero'],
      activityLevel: map['nivelAtividade'],
      objective: map['objetivo'],
      dailyCalories: map['caloriasDiarias'],
    );
  }

  String toJson() {
    final jsonMap = toMap();
    return jsonEncode(jsonMap);
  }

  factory CalculationModel.fromJson(String source) {
    final map = jsonDecode(source);
    return CalculationModel.fromMap(map);
  }
}
