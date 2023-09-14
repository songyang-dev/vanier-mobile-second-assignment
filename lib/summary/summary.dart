import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/daily.dart';
import '../shared/shared.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (answers.sleep != null)
                Text("Your sleep was ${answers.sleep!.toReadableString()}.")
              else
                const Text("Your sleep is unknown."),
              if (answers.mood != null)
                Text("Your mood was ${answers.mood!.toReadableString()}.")
              else
                const Text("Your mood is unknown."),
              if (answers.exercise != null)
                Text(
                    "You did ${answers.exercise!.toReadableString()} exercises.")
              else
                const Text("How much exercise did you do?"),
              if (answers.waterCups != null)
                Text(
                    "You drank ${answers.waterCups?.toStringAsPrecision(2)} cups of water.")
              else
                const Text("Did you drink any water today?"),
              if (answers.didSomethingNew == true)
                const Text("You did something new!")
              else if (answers.didSomethingNew == false)
                const Text("You didn't do something new.")
              else
                const Text("Did you do something new?"),
              if (answers.notes != null)
                Text("You noted down: ${answers.notes}")
              else
                const Text("There was no notes left."),
            ],
          ),
        ),
      ),
    );
  }
}
