import 'package:flutter/material.dart';

class HistoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HistoryAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Transform.translate(
        offset: const Offset(-25, 0),
        child: const Text('Último Cálculo'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}