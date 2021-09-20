import 'dart:math';

import 'package:bmi/models/bmi.dart';

class BMIController {
  Bmi bmi;
  BMIController({
    required this.bmi,
  });

  double _calculateBMI() {
    double res = bmi.weight / pow(bmi.height / 100, 2);
    return res;
  }

  String getBMI() {
    return _calculateBMI().toStringAsFixed(2);
  }

  String getResult() {
    if (_calculateBMI() >= 25) {
      return "Overweight";
    } else if (_calculateBMI() >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getOverview() {
    if (_calculateBMI() >= 25) {
      return "You have higher than normal weight. Burn more calories and do more exercise.";
    } else if (_calculateBMI() >= 18.5) {
      return "You have normal body weight. Good Work.";
    } else {
      return "You have lower than normal body weight. Eat more.";
    }
  }
}
