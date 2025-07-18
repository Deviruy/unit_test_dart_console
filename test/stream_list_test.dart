import 'package:test/test.dart';
import 'package:unit_test_dart_console/stream_list.dart';

void main() {
  group('Stream function test | ', () {
    test('Should return a list of int', () {
      final stream = countStream();
      expect(stream, emitsInOrder([1, 2, 3, 4, 5]));
    });
    test('Should return a error if max <= 0', () {
      final stream = countStream(max: 0);
      expectLater(stream, emitsError(isA<ArgumentError>()));
    });
  });
}
