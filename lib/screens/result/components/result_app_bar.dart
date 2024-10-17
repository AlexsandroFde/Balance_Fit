import 'package:flutter/material.dart';

class ResultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ResultAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Transform.translate(
        offset: const Offset(-25, 0),
        child: const Text('Resultado'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
