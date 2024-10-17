import 'package:balance_fit/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSelector<T> extends StatefulWidget {
  final String labelText;
  final T selectedValue;
  final List<T> items;
  final ValueChanged<T> onChanged;
  final Map<T, IconData>? itemIcons;

  const CustomSelector({
    Key? key,
    required this.labelText,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.itemIcons,
  }) : super(key: key);

  @override
  CustomSelectorState<T> createState() => CustomSelectorState<T>();
}

class CustomSelectorState<T> extends State<CustomSelector<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(widget.items.length, (index) {
            final item = widget.items[index];
            final isSelected = widget.selectedValue == item;
            final itemIcon = widget.itemIcons?[item];

            return Expanded(
              child: Row(
                children: [
                  if (index > 0) const SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 56),
                        backgroundColor: isSelected ? AppColors.theme : AppColors.disable,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        widget.onChanged(item);
                      },
                      child: itemIcon != null
                          ? Icon(
                        itemIcon,
                        color: AppColors.white,
                      )
                          : Text(
                        item.toString(),
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (index < widget.items.length - 1) const SizedBox(width: 5),
                ],
              ),
            );
          }),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}