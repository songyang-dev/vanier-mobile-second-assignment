import 'package:flutter/material.dart';

import '../shared/shared.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: WellnessAppNavigationBar(index: 2),
    );
  }
}
