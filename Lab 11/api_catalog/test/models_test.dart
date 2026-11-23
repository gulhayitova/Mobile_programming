import 'dart:convert';
import 'dart:io';

import 'package:api_catalog/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses the saved fixture', () {
    final json = jsonDecode(File('test/fixtures/product.json').readAsStringSync())
        as Map<String, dynamic>;
    final product = Product.fromJson(json);

    expect(product.title, 'Essence Mascara Lash Princess');
    expect(product.price, isA<double>());
    expect(product.tags.length, 2);
    expect(product.reviews.length, 3);
    expect(product.dimensions.width, isA<double>());
  });

  test('does not crash when brand and tags are missing', () {
    final json = {
      'id': 1,
      'title': 'No brand',
      'price': 10, // an int on purpose: must still become a double
      'rating': 4,
      'thumbnail': 'x.png',
      'dimensions': {'width': 1, 'height': 2, 'depth': 3},
      'reviews': [],
      // brand and tags are missing
    };
    final product = Product.fromJson(json);

    expect(product.tags, isEmpty);
    expect(product.brand, isNull);
    expect(product.price, 10.0);
  });
}