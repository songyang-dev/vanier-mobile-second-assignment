import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../services/daily.dart';
import '../shared/shared.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  String _didSomethingNew(BuildContext context) {
    var answers = Provider.of<DailyQuestions>(context);
    if (answers.didSomethingNew == true) {
      return "You did something new!";
    } else if (answers.didSomethingNew == false) {
      return "You didn't do something new.";
    } else {
      return "Did you do something new?";
    }
  }

  @override
  Widget build(BuildContext context) {
    var answers = Provider.of<DailyQuestions>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Summary"),
      ),
      bottomNavigationBar: const WellnessAppNavigationBar(index: 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            children: [
              CareListTile(
                  text: "Your sleep was ${answers.sleep.toReadableString()}."),
              CareListTile(
                  text: "Your mood was ${answers.mood.toReadableString()}."),
              CareListTile(
                  text:
                      "You did ${answers.exercise.toReadableString()} exercises."),
              CareListTile(
                  text:
                      "You drank ${answers.waterCups.toStringAsPrecision(2)} cups of water."),
              CareListTile(text: _didSomethingNew(context)),
              CareListTile(text: "You noted down: ${answers.notes}"),
            ],
          ),
        ),
      ),
    );
  }
}

class CareListTile extends StatelessWidget {
  const CareListTile({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(FontAwesomeIcons.handHoldingHeart),
      title: Text(text),
    );
  }
}
