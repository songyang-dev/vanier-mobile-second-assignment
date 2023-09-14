import 'package:flutter/material.dart';

class DailyQuestions extends ChangeNotifier {
  Quality _sleep = Quality.average;

  Quality get sleep => _sleep;

  set sleep(Quality value) {
    _sleep = value;
    notifyListeners();
  }

  Quality _mood = Quality.average;

  Quality get mood => _mood;

  set mood(Quality value) {
    _mood = value;
    notifyListeners();
  }

  Quantity _exercise = Quantity.none;

  Quantity get exercise => _exercise;

  set exercise(Quantity value) {
    _exercise = value;
    notifyListeners();
  }

  double _waterCups = 0;

  double get waterCups => _waterCups;

  set waterCups(double value) {
    _waterCups = value;
    notifyListeners();
  }

  bool _didSomethingNew = false;

  bool get didSomethingNew => _didSomethingNew;

  set didSomethingNew(bool value) {
    _didSomethingNew = value;
    notifyListeners();
  }

  String _notes = "";

  String get notes => _notes;

  set notes(String value) {
    _notes = value;
    notifyListeners();
  }

  void reset() {
    sleep = Quality.average;
    mood = Quality.average;
    exercise = Quantity.none;
    waterCups = 0;
    didSomethingNew = false;
    notes = "";
  }
}

enum Quality { horrible, bad, average, good, excellent }

extension ReadableQuality on Quality {
  String toReadableString() {
    return switch (this) {
      Quality.average => "Average",
      Quality.bad => "Bad",
      Quality.excellent => "Excellent",
      Quality.good => "Good",
      Quality.horrible => "Horrible",
    };
  }
}

extension QualityIndex on Quality {
  double toIndex() {
    return switch (this) {
      Quality.horrible => 0,
      Quality.bad => 1,
      Quality.average => 2,
      Quality.good => 3,
      Quality.excellent => 4,
    };
  }
}

enum Quantity { none, little, some, aLot }

extension ReadableQuantity on Quantity {
  String toReadableString() {
    return switch (this) {
      Quantity.aLot => "a lot of",
      Quantity.little => "little",
      Quantity.none => "no",
      Quantity.some => "some",
    };
  }
}
