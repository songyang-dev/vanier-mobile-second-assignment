import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../login/login.dart';
import '../services/authentication.dart';
import '../shared/shared.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      bottomNavigationBar: const WellnessAppNavigationBar(index: 2),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/person.png"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Text("Anonymous user"),
                  Text(
                      "Signed up on ${Authentication().user!.metadata.creationTime?.toUtc()}"),
                  const SizedBox(height: 32),
                  ElevatedButton(
                      onPressed: () async {
                        await Authentication().signOut();
                        if (!context.mounted) return;
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false);
                      },
                      child: const Text("Sign out")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
