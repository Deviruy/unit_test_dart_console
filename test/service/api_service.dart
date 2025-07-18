import 'dart:async';

import 'package:test/test.dart';
import 'package:unit_test_dart_console/model/product_model.dart';
import 'package:unit_test_dart_console/service/api_service.dart';
import 'package:uno/src/presenter/uno_base.dart';
import 'package:uno/uno.dart';

class UnoMock implements Uno {
  final bool withError;

  UnoMock({this.withError = false});

  @override
  Future<Response> get(
    String url, {
    Duration? timeout,
    Map<String, String> params = const {},
    Map<String, String> headers = const {},
    ResponseType responseType = ResponseType.json,
    DownloadCallback? onDownloadProgress,
    ValidateCallback? validateStatus,
  }) async {
    if (withError) {
      throw UnoError('Error');
    }
    return Response(
      headers: headers,
      request: Request(
        uri: Uri.base,
        method: '',
        headers: {},
        timeout: Duration.zero,
      ),
      status: 200,
      data: productListJson,
    );
  }

  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('Testing the apiService | ', () {
    test('Should return a list of Product', () {
      final uno = UnoMock();
      final service = ApiService(uno: uno);

      expect(
        service.getProducts(),
        completion([
          Product(id: 1, title: 'title', price: 12.0),
          Product(id: 2, title: 'title2', price: 13.0),
        ]),
      );
    });

    test('Should return a empty Product list when has error', () {
      final uno = UnoMock(withError: true);
      final service = ApiService(uno: uno);

      expect(service.getProducts(), completion([]));
    });
  });
}

final productListJson = [
  {'id': 1, 'title': 'title', 'price': 12.0},
  {'id': 2, 'title': 'title2', 'price': 13.0},
];
