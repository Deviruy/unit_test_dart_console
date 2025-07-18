import 'package:test/test.dart';
import 'package:unit_test_dart_console/calculate_bmr.dart';

void main() {
  group('Testing BMR function | ', () {
    test('Should throw error with invalid parameters', () {
      expect(
        () => calculateBMR(
          gender: Gender.male,
          weightKg: 0,
          heightCm: 184,
          age: 20,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });
    test('Function test calculateBMR', () {
      final bmr = calculateBMR(
        gender: Gender.male,
        weightKg: 76,
        heightCm: 186,
        age: 23,
      );
      expect(bmr, closeTo(1868.46, 0.01));
    });
    test('More calculateBMR function tests', () {
      // arrange
      final gender = Gender.male;
      final weight = 120.0;
      final height = 193.0;
      final age = 33;
      // act
      final bmr = calculateBMR(
        gender: gender,
        weightKg: weight,
        heightCm: height,
        age: age,
      );
      // assert
      expect(bmr, closeTo(2434.66, 0.01));
      expect(bmr, equals(2434.66));
      expect(bmr, isA<double>());
      expect(bmr, greaterThan(0));
      expect(bmr, isPositive);
    });
  });
}
