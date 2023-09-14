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
        QualitySlider(
          answerCatcher: (quality) => answers.sleep = quality,
        ),
        const Text("How was your mood today?"),
        QualitySlider(
          answerCatcher: (quality) => answers.mood = quality,
        ),
        const Text("How much exercise did you do today?"),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: QuantityDropdown(
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
          child: TextField(
            maxLines: 2,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            onChanged: (value) {
              answers.notes = value;
            },
          ),
        )
      ],
    );
  }
}

class WaterIntake extends StatefulWidget {
  const WaterIntake({super.key});

  @override
  State<WaterIntake> createState() => _WaterIntakeState();
}

class _WaterIntakeState extends State<WaterIntake> {
  double _waterCups = 4;
  @override
  Widget build(BuildContext context) {
    var answers = Provider.of<DailyQuestions>(context);
    answers.waterCups = _waterCups;

    return Row(
      children: [
        const Text("0"),
        Expanded(
          child: Slider(
            value: _waterCups,
            min: 0,
            max: 8,
            onChanged: (value) {
              setState(() {
                _waterCups = value;
                answers.waterCups = value;
              });
            },
          ),
        ),
        const Text("8"),
      ],
    );
  }
}

class DoSomethingNew extends StatefulWidget {
  const DoSomethingNew({super.key});

  @override
  State<DoSomethingNew> createState() => _DoSomethingNewState();
}

class _DoSomethingNewState extends State<DoSomethingNew> {
  bool _didSomethingNew = false;

  @override
  Widget build(BuildContext context) {
    var answers = Provider.of<DailyQuestions>(context);
    answers.didSomethingNew = _didSomethingNew;
    return ListTile(
      leading: Checkbox(
        value: _didSomethingNew,
        onChanged: (value) {
          setState(() {
            _didSomethingNew = value!;
            answers.didSomethingNew = _didSomethingNew;
          });
        },
      ),
      title: const Text("Yes, I did something new."),
    );
  }
}
