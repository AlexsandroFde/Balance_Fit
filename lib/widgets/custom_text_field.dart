import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String suffixText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;

  CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.suffixText,
    required this.labelText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16, // Tamanho da fonte do label
            fontWeight: FontWeight.bold, // Fonte em negrito
          ),
        ),
        const SizedBox(height: 4), // Espaço entre o label e o TextFormField
        SizedBox(
          height: 62,
          child: TextFormField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[400]), // Cor do texto de exemplo
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue), // Cor da borda
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Align(
                  heightFactor: 0,
                  widthFactor: 0,
                  alignment: Alignment.centerRight,
                  child: Transform.translate(
                    offset: Offset(0, -1),
                    child: Text(
                      suffixText, // Texto do sufixo
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              errorStyle: const TextStyle(
                height: 0,
                fontSize: 12, // Tamanho da fonte da mensagem de erro
              ),
            ),
            style: const TextStyle(fontSize: 16), // Tamanho da fonte
            validator: validator, // Validação do campo
          ),
        ),
      ],
    );
  }
}
