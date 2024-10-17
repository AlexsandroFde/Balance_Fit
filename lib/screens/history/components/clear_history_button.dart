import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class ClearHistoryButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ClearHistoryButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 56),
          backgroundColor: AppColors.theme,
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: const Text(
          'Limpar Histórico',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}