import 'package:flutter/material.dart';

import '../shared/shared.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: WellnessAppNavigationBar(index: 1),
    );
  }
}
