import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../shared/shared.dart';

class Authentication {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> anonymousLogin(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case "operation-not-allowed":
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ErrorScreen(
                message:
                    "Anonymous authentication has not been enabled for this project.",
              ),
            ),
          );
          break;

        default:
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ErrorScreen(
                message: "Unknown authentication error.",
              ),
            ),
          );
          break;
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
