import 'package:balance_fit/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String label;
  final String value;

  const CustomRow({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Divider(color: AppColors.secondaryBlack),
            ),
          ),
          Text(value, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}