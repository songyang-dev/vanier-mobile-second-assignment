import 'package:flutter/material.dart';

import '../home/home.dart';
import '../services/authentication.dart';
import '../shared/shared.dart';
import 'login_choices.dart';

/// This widget activates if the user changes or has never logged in
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Authentication().userStream,
      builder: (context, snapshot) {
        // still connecting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        }
        // error
        if (snapshot.hasError) {
          return const ErrorScreen(
            message: "Failed to connect to authentication services",
          );
        }
        // logged in, proceed to the app
        if (snapshot.hasData) {
          return const HomeScreen();
        }
        // otherwise, show the login screen
        else {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Login to Daily Wellness"),
                centerTitle: true,
              ),
              body: const LoginChoices());
        }
      },
    );
  }
}
