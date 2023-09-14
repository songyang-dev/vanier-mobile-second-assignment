import 'package:flutter/material.dart';
import '../services/daily.dart';

class QualitySlider extends StatefulWidget {
  const QualitySlider({super.key, required this.answerCatcher});

  final void Function(Quality quality) answerCatcher;

  @override
  State<QualitySlider> createState() => _QualitySliderState();
}

class _QualitySliderState extends State<QualitySlider> {
  double _currentValue = 2;

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
    widget.answerCatcher(_toQuality(_currentValue));

    return Slider(
      value: _currentValue,
      min: 0,
      max: 4,
      divisions: 4,
      label: _toQuality(_currentValue).toReadableString(),
      onChanged: (value) {
        setState(() {
          _currentValue = value;
          widget.answerCatcher(_toQuality(value));
        });
      },
    );
  }
}
