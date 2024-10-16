import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final String title;
  final String value;

  ResultDisplay({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
        Divider(),
      ],
    );
  }
}
