import 'package:flutter/material.dart';

class WellnessAppNavigationBar extends StatelessWidget {
  const WellnessAppNavigationBar({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "Summary"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
      ],
      onTap: (value) => switch (value) {
        0 => Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false),
        1 => Navigator.of(context)
            .pushNamedAndRemoveUntil('/summary', (route) => false),
        2 => Navigator.of(context)
            .pushNamedAndRemoveUntil('/profile', (route) => false),
        _ => {},
      },
      currentIndex: index,
    );
  }
}
