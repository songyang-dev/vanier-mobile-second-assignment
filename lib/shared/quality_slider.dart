import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/daily.dart';

enum Question { sleep, mood }

class QualitySlider extends StatelessWidget {
  const QualitySlider({
    super.key,
    required this.related,
  });

  final Question related;

  Quality _toQuality(double value) {
    return switch (value) {
      0 => Quality.horrible,
      1 => Quality.bad,
      2 => Quality.average,
      3 => Quality.good,
      4 => Quality.excellent,
      _ => Quality.horrible,
    };
  }

  @override
  Widget build(BuildContext context) {
    var answer = Provider.of<DailyQuestions>(context);
    var sliderValue = switch (related) {
      Question.mood => answer.mood,
      Question.sleep => answer.sleep,
    }
        .toIndex();

    return Slider(
      value: sliderValue,
      min: 0,
      max: 4,
      divisions: 4,
      label: _toQuality(sliderValue).toReadableString(),
      onChanged: (value) {
        switch (related) {
          case Question.mood:
            answer.mood = _toQuality(value);
            break;
          case Question.sleep:
            answer.sleep = _toQuality(value);
            break;
        }
        ;
      },
    );
  }
}
