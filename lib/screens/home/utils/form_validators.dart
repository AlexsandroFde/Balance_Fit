class FormValidators {
  static String? validatePeso(String? value) {
    if (value == null || value.isEmpty) return 'Insira seu peso';
    final number = double.tryParse(value.replaceAll(',', '.'));
    return number == null || number <= 0 ? 'Insira um peso válido' : null;
  }

  static String? validateAltura(String? value) {
    if (value == null || value.isEmpty) return 'Insira sua altura';
    final number = double.tryParse(value.replaceAll(',', '.'));
    return number == null || number <= 0 ? 'Insira uma altura válida' : null;
  }

  static String? validateIdade(String? value) {
    if (value == null || value.isEmpty) return 'Insira sua idade';
    final number = int.tryParse(value);
    return number == null || number <= 0 ? 'Insira uma idade válida' : null;
  }
}