import 'package:flutter/material.dart';
import '../screens/history/history_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/result/result_screen.dart';

// Configuração de Rotas
class AppRoutes {
  static const String home = '/';
  static const String resultado = '/resultado';
  static const String historico = '/historico';

  static Map<String, Widget Function(BuildContext)> define() {
    return {
      home: (context) => const HomeScreen(),
      resultado: (context) => const ResultScreen(),
      historico: (context) => const HistoryScreen(),
    };
  }
}