import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'login/login.dart';
import 'routes.dart';
import 'services/daily.dart';
import 'shared/shared.dart';

void main() {
  // For Firebase
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    // Exposes/provides the data model as an initial state to the entire widget
    // tree
    Provider(
      create: (_) => DailyQuestions(),
      child: const WellnessApp(),
    ),
  );
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
            theme: ThemeData(
              textTheme: const TextTheme(
                bodyMedium: TextStyle(fontSize: 18),
              ),
            ),
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
