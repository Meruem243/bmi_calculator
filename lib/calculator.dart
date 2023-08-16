import 'dart:math';

class Calculator {
  Calculator({required this.height, required this.weight});

  int height;
  int weight;
  double _bmi = 0;

  String? calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    _bmi = double.parse(_bmi.toStringAsFixed(1));
    return _bmi.toString();
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher body weight than normal. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower body weight than normal. Try to eat a bit more.';
    }
  }
}
