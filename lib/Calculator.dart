import 'dart:math';

class Calculator {
  Calculator({this.weightValue, this.heightValue});

  int weightValue;
  int heightValue;
  double _bmiValue;

  String calculateBMI() {
    _bmiValue = weightValue / pow(heightValue / 100, 2);
    return _bmiValue.toStringAsFixed(1);
  }

  String getTitle() {
    if (_bmiValue >= 25) {
      return 'Over Weight';
    } else if (_bmiValue > 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getInterpretation() {
    if (_bmiValue >= 25) {
      return 'You have higher than normal body weight, try to exercise more.';
    } else if (_bmiValue > 18.5) {
      return 'You have normal body weight, good job!';
    } else {
      return 'You have lower than normal body weight, you should eat a bit more.';
    }
  }
}
