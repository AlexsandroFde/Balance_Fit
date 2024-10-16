class CalculoModel {
  final double peso;
  final double altura;
  final int idade;
  final String genero;
  final String nivelAtividade;
  final String objetivo;
  final double caloriasDiarias;

  CalculoModel({
    required this.peso,
    required this.altura,
    required this.idade,
    required this.genero,
    required this.nivelAtividade,
    required this.objetivo,
    required this.caloriasDiarias,
  });

  Map<String, dynamic> toMap() {
    return {
      'peso': peso,
      'altura': altura,
      'idade': idade,
      'genero': genero,
      'nivelAtividade': nivelAtividade,
      'objetivo': objetivo,
      'caloriasDiarias': caloriasDiarias,
    };
  }

  factory CalculoModel.fromMap(Map<String, dynamic> map) {
    return CalculoModel(
      peso: map['peso'],
      altura: map['altura'],
      idade: map['idade'],
      genero: map['genero'],
      nivelAtividade: map['nivelAtividade'],
      objetivo: map['objetivo'],
      caloriasDiarias: map['caloriasDiarias'],
    );
  }
}
