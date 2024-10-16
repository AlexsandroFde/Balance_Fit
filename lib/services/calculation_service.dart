double calcularTMB(double peso, double altura, int idade, String genero) {
  if (genero == 'Masculino') {
    return 88.362 + (13.397 * peso) + (4.799 * altura) - (5.677 * idade);
  } else {
    return 447.593 + (9.247 * peso) + (3.098 * altura) - (4.330 * idade);
  }
}

double calcularCaloriasDiarias(double tmb, String nivelAtividade, String objetivo) {
  double fatorAtividade;

  switch (nivelAtividade) {
    case 'Sedentário':
      fatorAtividade = 1.2;
      break;
    case 'Levemente ativo':
      fatorAtividade = 1.375;
      break;
    case 'Moderadamente ativo':
      fatorAtividade = 1.55;
      break;
    case 'Muito ativo':
      fatorAtividade = 1.725;
      break;
    default:
      fatorAtividade = 1.0;
  }

  double caloriasDiarias = tmb * fatorAtividade;

  if (objetivo == 'Perda de peso') {
    return caloriasDiarias * 0.8;
  } else {
    return caloriasDiarias * 1.15;
  }
}
