import 'dart:math';

import 'package:bmi/models/bmi.dart';

/// handles logics for calculating BMI
class BMIController {
  /// instance of BMI model class
  BMI bmi;
  BMIController({
    required this.bmi,
  });

  /// returns BMI as double value
  double _calculateBMI() {
    double res = bmi.weight / pow(bmi.height / 100, 2);
    return res;
  }

  /// converts double to string with two decimal point
  String getBMI() {
    return _calculateBMI().toStringAsFixed(2);
  }

/// returns the result depending upon the BMI
  String getResult() {
    if (_calculateBMI() >= 25) {
      return "Overweight";
    } else if (_calculateBMI() >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

/// gives overview about your bmi
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
