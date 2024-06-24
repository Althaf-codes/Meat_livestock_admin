import 'dart:convert';

import 'package:mq_admin/model/product_model.dart';

class AllProduct {
  AllProduct({
    required this.allProducts,
  });

  List<Product> allProducts;

  AllProduct copyWith({
    List<Product>? allProducts,
  }) =>
      AllProduct(
        allProducts: allProducts ?? this.allProducts,
      );

  factory AllProduct.fromJson(String str) =>
      AllProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllProduct.fromMap(Map<String, dynamic> json) => AllProduct(
        allProducts: List<Product>.from(
            json["allProducts"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "allProducts": List<dynamic>.from(allProducts.map((x) => x.toMap())),
      };
}
