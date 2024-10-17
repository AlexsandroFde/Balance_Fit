import 'package:balance_fit/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class EmptyTitle extends StatelessWidget {
  const EmptyTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CustomTitle(title: 'Nenhum cálculo salvo'));
  }
}