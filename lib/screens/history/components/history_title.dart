import 'package:balance_fit/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class HistoryTitle extends StatelessWidget {
  const HistoryTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomTitle(title: 'Último Cálculo Realizado');
  }
}