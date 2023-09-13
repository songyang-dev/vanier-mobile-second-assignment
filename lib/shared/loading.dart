import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingCircle(),
    );
  }
}

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 250,
      width: 250,
      child: CircularProgressIndicator(),
    );
  }
}
