import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/daily.dart';
import '../shared/shared.dart';

class Questionnaire extends StatelessWidget {
  const Questionnaire({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var answers = Provider.of<DailyQuestions>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(child: Text("Let's begin with some questions.")),
        const SizedBox(height: 25),
        // sleep question
        const Text("Did you sleep well last night?"),
        const QualitySlider(
          related: Question.sleep,
        ),
        const Text("How was your mood today?"),
        const QualitySlider(
          related: Question.mood,
        ),
        const Text("How much exercise did you do today?"),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: QuantityDropdown(
            initialQuantity: answers.exercise,
            quantityCatcher: (quantity) => answers.exercise = quantity,
          ),
        ),
        const Text("How much water did you drink? (cups)"),
        const WaterIntake(),
        const Text("Did you do something new today?"),
        const DoSomethingNew(),
        const Text("Personal notes"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextFormField(
            initialValue: answers.notes,
            maxLines: 2,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("What would you like to say?")),
            onChanged: (value) {
              answers.notes = value;
            },
          ),
        )
      ],
    );
  }
}

class WaterIntake extends StatelessWidget {
  const WaterIntake({super.key});

  @override
  Widget build(BuildContext context) {
    var answers = Provider.of<DailyQuestions>(context);
    var waterCups = answers.waterCups;

    return Row(
      children: [
        const Text("0"),
        Expanded(
          child: Slider(
            value: waterCups,
            min: 0,
            max: 8,
            onChanged: (value) {
              waterCups = value;
              answers.waterCups = value;
            },
          ),
        ),
        const Text("8"),
      ],
    );
  }
}

class DoSomethingNew extends StatelessWidget {
  const DoSomethingNew({super.key});

  @override
  Widget build(BuildContext context) {
    var answers = Provider.of<DailyQuestions>(context);
    var didSomethingNew = answers.didSomethingNew;
    return ListTile(
      leading: Checkbox(
          value: didSomethingNew,
          onChanged: (value) {
            didSomethingNew = value!;
            answers.didSomethingNew = didSomethingNew;
          }),
      title: const Text("Yes, I did something new."),
    );
  }
}
