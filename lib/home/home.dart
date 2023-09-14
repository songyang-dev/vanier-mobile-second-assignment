import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../services/daily.dart';
import '../shared/navigation_bar.dart';
import 'questionnaire.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<DailyQuestions>(context).nullify();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Daily Wellness"),
      ),
      bottomNavigationBar: const WellnessAppNavigationBar(index: 0),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Welcome home.",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
            Center(
              child: Icon(
                FontAwesomeIcons.handHoldingHeart,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const Divider(),
            const SizedBox(height: 25),
            const Questionnaire(),
          ],
        ),
      ),
    );
  }
}
