import 'package:unit_test_dart_console/model/product_model.dart';
import 'package:uno/uno.dart';

class ApiService {
  final Uno uno;

  ApiService({required this.uno});

  Future<List<Product>> getProducts() async {
    try {
      final response = await uno.get('/product');
      final list = response.data as List;
      return list.map((e) => Product.fromJson(e)).toList();
    } on UnoError catch (e) {
      return [];
    }
  }
}
