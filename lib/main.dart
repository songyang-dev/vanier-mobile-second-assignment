import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'login/login.dart';
import 'routes.dart';
import 'shared/shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WellnessApp());
}

class WellnessApp extends StatefulWidget {
  const WellnessApp({super.key});

  @override
  State<WellnessApp> createState() => _WellnessAppState();
}

/// This is to set up a connection to the Firebase backend
class _WellnessAppState extends State<WellnessApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // error situation
        if (snapshot.hasError) {
          return MaterialApp(
            home: ErrorScreen(
              message: "Failed to initialize Firebase: ${snapshot.error}",
            ),
          );
        }

        // connected, go to the login screen
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Daily Wellness',
            routes: routes,
            home: const LoginScreen(),
          );
        }

        // otherwise Firebase is still connecting
        return const MaterialApp(
          home: LoadingScreen(),
        );
      },
    );
  }
}
