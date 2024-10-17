double calculateTMB(double weight, double height, int age, String gender) {
  if (gender == 'Masculino') {
    return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }
}

double calculateDailyCalories(double tmb, String activityLevel, String objective) {
  double activityFactor;

  switch (activityLevel) {
    case 'Sedentário':
      activityFactor = 1.2;
      break;
    case 'Levemente ativo':
      activityFactor = 1.375;
      break;
    case 'Moderadamente ativo':
      activityFactor = 1.55;
      break;
    case 'Muito ativo':
      activityFactor = 1.725;
      break;
    default:
      activityFactor = 1.0;
  }

  double dailyCalories = tmb * activityFactor;

  if (objective == 'Perda de peso') {
    return dailyCalories * 0.8;
  } else {
    return dailyCalories * 1.15;
  }
}