import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  final String labelText;
  final String value;
  final List<String> items;
  final void Function(String?)? onChanged;

  const CustomDropdownField({
    Key? key,
    required this.labelText,
    required this.value,
    required this.items,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 62,
          child: DropdownButtonFormField<String>(
            value: value,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 16,
                    color: value == item ? Colors.blue : Colors.black,
                    fontWeight: value == item ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            // Usando selectedItemBuilder para personalizar a exibição do item selecionado no campo
            selectedItemBuilder: (BuildContext context) {
              return items.map((String item) {
                return Text(
                  item,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black, // Cor fixa para o campo de exibição
                    fontWeight: FontWeight.normal,
                  ),
                );
              }).toList();
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
            dropdownColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
