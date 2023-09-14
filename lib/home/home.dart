import 'package:flutter/material.dart';

import '../shared/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Daily Wellness"),
      ),
      bottomNavigationBar: const WellnessAppNavigationBar(index: 0),
    );
  }
}
