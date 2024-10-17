import 'package:balance_fit/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  const CustomTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.theme,
      ),
      textAlign: TextAlign.center,
    );
  }
}
