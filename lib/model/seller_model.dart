// To parse this JSON data, do
//
//     final seller = sellerFromMap(jsonString);

import 'dart:convert';

class Seller {
  Seller({
    required this.id,
    required this.sellerName,
    required this.userId,
    required this.phoneNumber,
    required this.password,
    required this.isPremiumSeller,
    required this.companyName,
    required this.location,
    required this.specializedCategory,
    required this.orders,
    required this.products,
    required this.ratings,
    required this.isNewSeller,
    required this.isActive,
  });
  final String id;
  final String sellerName;
  final String userId;
  final String phoneNumber;
  final String password;
  final bool isPremiumSeller;
  final String companyName;
  final String location;
  final List<dynamic> specializedCategory;
  final List<dynamic> orders;
  final List<dynamic> products;
  final List<dynamic> ratings;
  final bool isNewSeller;
  final bool isActive;

  Seller copyWith(
    String? id,
    String? sellerName,
    String? userId,
    String? phoneNumber,
    String? password,
    bool? isPremiumSeller,
    String? companyName,
    String? location,
    List<dynamic>? specializedCategory,
    List<dynamic>? orders,
    List<dynamic>? products,
    List<dynamic>? ratings,
    bool? isNewSeller,
    bool? isActive,
  ) =>
      Seller(
        id: id ?? this.id,
        sellerName: sellerName ?? this.sellerName,
        userId: userId ?? this.userId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        isPremiumSeller: isPremiumSeller ?? this.isPremiumSeller,
        companyName: companyName ?? this.companyName,
        location: location ?? this.location,
        specializedCategory: specializedCategory ?? this.specializedCategory,
        orders: orders ?? this.orders,
        products: products ?? this.products,
        ratings: ratings ?? this.ratings,
        isNewSeller: isNewSeller ?? this.isNewSeller,
        isActive: isActive ?? this.isActive,
      );

  factory Seller.fromJson(String str) => Seller.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Seller.fromMap(Map<String, dynamic> json) => Seller(
        id: json['_id'] ?? '',
        sellerName: json["sellerName"] ?? '',
        userId: json["userID"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        password: json["password"] ?? '',
        isPremiumSeller: json["isPremiumSeller"] ?? false,
        companyName: json["companyName"] ?? '',
        location: json["location"] ?? '',
        specializedCategory:
            List<String>.from(json["specializedCategory"].map((x) => x)),
        orders: List<Map<String, dynamic>>.from(
          json['orders']?.map(
            (x) => Map<String, dynamic>.from(x),
          ),
        ),
        products: List<Map<String, dynamic>>.from(
          json['products']?.map(
            (x) => Map<String, dynamic>.from(x),
          ),
        ),
        ratings: List<Map<String, dynamic>>.from(
          json['ratings']?.map(
            (x) => Map<String, dynamic>.from(x),
          ),
        ),
        isNewSeller: json["isNewSeller"] ?? false,
        isActive: json["isActive"] ?? false,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        "sellerName": sellerName,
        "userID": userId,
        "phoneNumber": phoneNumber,
        "password": password,
        "isPremiumSeller": isPremiumSeller,
        "companyName": companyName,
        "location": location,
        "specializedCategory":
            List<dynamic>.from(specializedCategory.map((x) => x)),
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "products": List<dynamic>.from(products.map((x) => x)),
        "ratings": List<dynamic>.from(ratings.map((x) => x)),
        "isNewSeller": isNewSeller,
        "isActive": isActive,
      };
}
