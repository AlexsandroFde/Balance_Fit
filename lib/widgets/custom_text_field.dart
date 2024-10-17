import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String suffixText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;

  const CustomTextField({
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
          height: 72,
          child: TextFormField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: AppColors.hintText),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.theme,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.theme,
                  width: 1.5,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Align(
                  heightFactor: 0,
                  widthFactor: 0,
                  alignment: Alignment.centerRight,
                  child: Transform.translate(
                    offset: const Offset(0, -1),
                    child: Text(
                      suffixText,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              errorStyle: const TextStyle(
                height: 0,
                fontSize: 12,
              ),
            ),
            style: const TextStyle(fontSize: 16),
            validator: validator,
          ),
        ),
      ],
    );
  }
}