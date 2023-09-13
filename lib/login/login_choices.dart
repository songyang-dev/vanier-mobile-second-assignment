import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/authentication.dart';

class LoginChoices extends StatelessWidget {
  const LoginChoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            FontAwesomeIcons.handHoldingHeart,
            size: 150,
            color: Theme.of(context).primaryColor,
          ),

          /// Google sign-in
          // Padding(
          //   padding: const EdgeInsets.all(25.0),
          //   child: ElevatedButton.icon(
          //     onPressed: () {},
          //     icon: const Icon(FontAwesomeIcons.google),
          //     label: const Text(
          //       "Google",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //     style: TextButton.styleFrom(
          //       padding: const EdgeInsets.all(24),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton.icon(
              onPressed: () async {
                await Authentication().anonymousLogin(context);
              },
              icon: const Icon(FontAwesomeIcons.userNinja),
              label: const Text(
                "Anonymous Login",
                style: TextStyle(fontSize: 20),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
