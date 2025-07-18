import 'package:unit_test_dart_console/calculate_bmr.dart';
import 'package:unit_test_dart_console/fetch_numbers.dart';
import 'package:unit_test_dart_console/stream_list.dart';

void main() async {
  print(
    'BMR Result: ${calculateBMR(gender: Gender.male, weightKg: 76, heightCm: 186, age: 23)}!',
  );
  final numbers = await fetchNumbers();
  print('Your number list: $numbers');
  await for (final value in countStream()) {
    print('Value: $value');
  }
}
