import 'package:flutter/material.dart';

class FormCallbacks {
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<String?> onActivityLevelChanged;
  final ValueChanged<String> onObjectiveChanged;

  FormCallbacks({
    required this.onGenderChanged,
    required this.onActivityLevelChanged,
    required this.onObjectiveChanged,
  });

  void changeGenero(String newValue) {
    onGenderChanged(newValue);
  }

  void changeNivelAtividade(String? newValue) {
    onActivityLevelChanged(newValue);
  }

  void changeObjetivo(String newValue) {
    onObjectiveChanged(newValue);
  }
}