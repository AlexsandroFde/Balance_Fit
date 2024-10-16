import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator; // Adicionado para validação

  CustomTextField({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator, // Adicionado para validação
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: validator, // Usando a função de validação
    );
  }
}
