import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pattern_bloc/data/model/model.dart';

abstract class ProductRepo {
  Future<ProductModel?>? getProducts();
}

class ProductRepoImpl implements ProductRepo {
  @override
  Future<ProductModel?>? getProducts() async {
    final uri = Uri.http('panel.primebazar.com', '/api/product-core/suzuki-gsx-r150-fi-dual-channel-abs-yvj2/0/');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      final json = jsonDecode(response.body);
      return ProductModel.fromJson(json);
    } else {
      print(response.statusCode.toString());
    }
  }
}
