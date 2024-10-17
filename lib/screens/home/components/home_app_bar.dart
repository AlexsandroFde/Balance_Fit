import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Calculadora de Calorias'),
      actions: [
        IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
            Navigator.pushNamed(context, '/historico');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}