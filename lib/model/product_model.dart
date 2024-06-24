// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product({
    required this.id,
    required this.productName,
    required this.description,
    required this.highlightDescription,
    required this.elaborateDescription,
    required this.images,
    required this.quantity,
    required this.isHavingStock,
    required this.stockQuantity,
    required this.price,
    required this.isVerified,
    required this.sellerId,
    required this.buyers,
    required this.isDiscountable,
    required this.discount,
    required this.category,
    required this.ratings,
    required this.feedback,
    required this.isDeliverable,
    required this.deliverablespan,
  });

  String id;
  String productName;
  String description;
  String highlightDescription;
  String elaborateDescription;
  List<List<dynamic>> images;
  int quantity;
  bool isHavingStock;
  int stockQuantity;
  int price;
  bool isVerified;
  String sellerId;
  List<String> buyers;
  bool isDiscountable;
  int discount;
  Category category;
  List<dynamic> ratings;
  List<Feedback> feedback;
  bool isDeliverable;
  List<String> deliverablespan;

  Product copyWith({
    String? id,
    String? productName,
    String? description,
    String? highlightDescription,
    String? elaborateDescription,
    List<List<dynamic>>? images,
    int? quantity,
    bool? isHavingStock,
    int? stockQuantity,
    int? price,
    bool? isVerified,
    String? sellerId,
    List<String>? buyers,
    bool? isDiscountable,
    int? discount,
    Category? category,
    List<dynamic>? ratings,
    List<Feedback>? feedback,
    bool? isDeliverable,
    List<String>? deliverablespan,
  }) =>
      Product(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        description: description ?? this.description,
        highlightDescription: highlightDescription ?? this.highlightDescription,
        elaborateDescription: elaborateDescription ?? this.elaborateDescription,
        images: images ?? this.images,
        quantity: quantity ?? this.quantity,
        isHavingStock: isHavingStock ?? this.isHavingStock,
        stockQuantity: stockQuantity ?? this.stockQuantity,
        price: price ?? this.price,
        isVerified: isVerified ?? this.isVerified,
        sellerId: sellerId ?? this.sellerId,
        buyers: buyers ?? this.buyers,
        isDiscountable: isDiscountable ?? this.isDiscountable,
        discount: discount ?? this.discount,
        category: category ?? this.category,
        ratings: ratings ?? this.ratings,
        feedback: feedback ?? this.feedback,
        isDeliverable: isDeliverable ?? this.isDeliverable,
        deliverablespan: deliverablespan ?? this.deliverablespan,
      );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["_id"] ?? '',
        productName: json["productName"] ?? '',
        description: json["description"] ?? '',
        highlightDescription: json["highlightDescription"] ?? '',
        elaborateDescription: json["elaborateDescription"] ?? '',
        images: List<List<dynamic>>.from(
            json["images"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        quantity: json["quantity"] ?? 0,
        isHavingStock: json["isHavingStock"] ?? false,
        stockQuantity: json["stockQuantity"] ?? '',
        price: json["price"] ?? '',
        isVerified: json["isVerified"] ?? false,
        sellerId: json["sellerID"] ?? '',
        buyers: List<String>.from(json["buyers"].map((x) => x)),
        isDiscountable: json["isDiscountable"] ?? false,
        discount: json["discount"] ?? '',
        category: Category.fromMap(json["category"]),
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
        feedback: List<Feedback>.from(
            json["feedback"].map((x) => Feedback.fromMap(x))),
        isDeliverable: json["isDeliverable"] ?? false,
        deliverablespan:
            List<String>.from(json["deliverablespan"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "productName": productName,
        "description": description,
        "highlightDescription": highlightDescription,
        "elaborateDescription": elaborateDescription,
        "images": List<dynamic>.from(
            images.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "quantity": quantity,
        "isHavingStock": isHavingStock,
        "stockQuantity": stockQuantity,
        "price": price,
        "isVerified": isVerified,
        "sellerID": sellerId,
        "buyers": List<dynamic>.from(buyers.map((x) => x)),
        "isDiscountable": isDiscountable,
        "discount": discount,
        "category": category.toMap(),
        "ratings": List<dynamic>.from(ratings.map((x) => x)),
        "feedback": List<dynamic>.from(feedback.map((x) => x.toMap())),
        "isDeliverable": isDeliverable,
        "deliverablespan": List<dynamic>.from(deliverablespan.map((x) => x)),
      };
}

class Category {
  Category({
    required this.categoryName,
    required this.pet,
    required this.cattle,
    required this.accessories,
    required this.toy,
    required this.meat,
    required this.feed,
    required this.birds,
    required this.fishAndAquatics,
    required this.poultry,
    required this.medicine,
  });

  String categoryName;
  String pet;
  String cattle;
  String accessories;
  String toy;
  String meat;
  String feed;
  String birds;
  String fishAndAquatics;
  String poultry;
  String medicine;

  Category copyWith({
    String? categoryName,
    String? pet,
    String? cattle,
    String? accessories,
    String? toy,
    String? meat,
    String? feed,
    String? birds,
    String? fishAndAquatics,
    String? poultry,
    String? medicine,
  }) =>
      Category(
        categoryName: categoryName ?? this.categoryName,
        pet: pet ?? this.pet,
        cattle: cattle ?? this.cattle,
        accessories: accessories ?? this.accessories,
        toy: toy ?? this.toy,
        meat: meat ?? this.meat,
        feed: feed ?? this.feed,
        birds: birds ?? this.birds,
        fishAndAquatics: fishAndAquatics ?? this.fishAndAquatics,
        poultry: poultry ?? this.poultry,
        medicine: medicine ?? this.medicine,
      );

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        categoryName: json["categoryName"] ?? '',
        pet: json["pet"] ?? '',
        cattle: json["cattle"] ?? '',
        accessories: json["accessories"] ?? '',
        toy: json["toy"] ?? '',
        meat: json["meat"] ?? '',
        feed: json["feed"] ?? '',
        birds: json["birds"] ?? '',
        fishAndAquatics: json["fishAndAquatics"] ?? '',
        poultry: json["poultry"] ?? '',
        medicine: json["medicine"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "categoryName": categoryName,
        "pet": pet,
        "cattle": cattle,
        "accessories": accessories,
        "toy": toy,
        "meat": meat,
        "feed": feed,
        "birds": birds,
        "fishAndAquatics": fishAndAquatics,
        "poultry": poultry,
        "medicine": medicine,
      };
}

class Feedback {
  Feedback({
    required this.userId,
    required this.comment,
    required this.images,
  });

  String userId;
  String comment;
  String images;

  Feedback copyWith({
    String? userId,
    String? comment,
    String? images,
  }) =>
      Feedback(
        userId: userId ?? this.userId,
        comment: comment ?? this.comment,
        images: images ?? this.images,
      );

  factory Feedback.fromJson(String str) => Feedback.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Feedback.fromMap(Map<String, dynamic> json) => Feedback(
        userId: json["userId"] ?? '',
        comment: json["comment"] ?? '',
        images: json["images"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "comment": comment,
        "images": images,
      };
}
