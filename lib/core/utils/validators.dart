class Validator {}

extension ValidatorX on String {
  String initialWordCap() =>
      substring(0, 1).toUpperCase() + substring(1).toLowerCase();
}
