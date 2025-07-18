import 'package:test/test.dart';
import 'package:unit_test_dart_console/fetch_numbers.dart';

void main() {
  group('Testing Future function | ', () {
    test('Should throw error with invalid parameters', () async {
      expect(() => fetchNumbers(count: 0), throwsA(isA<ArgumentError>()));
    });
    test('Should return a list of numbers', () async {
      expect(fetchNumbers(), completion(isA<List<int>>()));
      expect(fetchNumbers(), completion(equals([1, 2, 3])));
    });
    test('Should return a list of ten numbers', () async {
      expect(fetchNumbers(count: 10), completion(hasLength(10)));
      expect(fetchNumbers(count: 10), completion((isA<List<int>>())));
      expect(
        fetchNumbers(count: 10),
        completion(equals([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])),
      );
    });
  });
}
