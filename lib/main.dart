import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/resultado_screen.dart';
import 'screens/historico_screen.dart';

void main() {
  runApp(const CalculadoraCaloriasApp());
}

class CalculadoraCaloriasApp extends StatelessWidget {
  const CalculadoraCaloriasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Calorias',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/resultado': (context) => ResultadoScreen(),
        '/historico': (context) => HistoricoScreen(),
      },
    );
  }
}
