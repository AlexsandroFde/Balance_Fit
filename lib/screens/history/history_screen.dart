import 'package:balance_fit/screens/history/components/empty_title.dart';
import 'package:balance_fit/screens/history/components/history_title.dart';
import 'package:flutter/material.dart';
import '../../services/storage_service.dart';
import '../../models/calculation_model.dart';
import 'components/history_app_bar.dart';
import 'components/calculo_details.dart';
import 'components/clear_history_button.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  CalculationModel? lastCalculation;

  @override
  void initState() {
    super.initState();
    loadLastCalculation();
  }

  Future<void> loadLastCalculation() async {
    CalculationModel? calculation = await getLastCalculation();
    setState(() {
      lastCalculation = calculation;
    });
  }

  void clear() async {
    await clearHistory();
    setState(() {
      lastCalculation = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HistoryAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[50]!, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: lastCalculation == null
            ? const EmptyTitle()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: HistoryTitle()
                  ),
                  const SizedBox(height: 10),
                  CalculoDetails(calculation: lastCalculation!),
                  const SizedBox(height: 20),
                  ClearHistoryButton(onPressed: clear),
                ],
              ),
      ),
    );
  }
}
