import 'dart:math';

class CalculateBMI {
  CalculateBMI({required this.height, required this.weight});

  final int height;
  final int weight;

  double? _bmi;

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'OverWeight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String giveFeedback() {
    if (_bmi! >= 25) {
      return 'Your weight is higher than normal body weight. Follow proper diet and exercise regularly.';
    } else if (_bmi! > 18.5) {
      return 'Your body weight is normal. Good Job.';
    } else {
      return 'Your body weight is lower than normal body weight. Eat more';
    }
  }
}
