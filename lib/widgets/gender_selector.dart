import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  final String selectedGender;
  final ValueChanged<String> onGenderChanged;

  GenderSelector({required this.selectedGender, required this.onGenderChanged});

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gênero:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56), // Mantém a altura
                  backgroundColor: widget.selectedGender == 'Masculino'
                      ? Colors.blueAccent
                      : Colors.grey[300],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  widget.onGenderChanged('Masculino');
                },
                child: Icon(
                  IconData(0xf0538, fontFamily: 'MaterialIcons'), // Ícone masculino
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56), // Mantém a altura
                  backgroundColor: widget.selectedGender == 'Feminino'
                      ? Colors.blueAccent
                      : Colors.grey[300],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  widget.onGenderChanged('Feminino');
                },
                child: Icon(
                  IconData(0xf05ab, fontFamily: 'MaterialIcons'), // Ícone feminino
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 14)
      ],
    );
  }
}
