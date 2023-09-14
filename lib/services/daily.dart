class DailyQuestions {
  Quality? sleep;
  Quality? mood;
  Quantity? exercise;
  double? waterCups;
  bool? didSomethingNew;
  String? notes;

  void nullify() {
    sleep = null;
    mood = null;
    exercise = null;
    waterCups = null;
    didSomethingNew = null;
    notes = null;
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
