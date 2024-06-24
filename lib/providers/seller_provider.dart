import 'package:flutter/material.dart';

import '../model/seller_model.dart';

class SellerProvider extends ChangeNotifier {
  Seller _seller = Seller(
      id: "",
      sellerName: "",
      userId: "",
      phoneNumber: "",
      password: "",
      isPremiumSeller: false,
      companyName: "",
      location: "",
      specializedCategory: [],
      orders: [],
      products: [],
      ratings: [],
      isNewSeller: true,
      isActive: false);

  Seller get seller => _seller;

  void setSeller(String seller) {
    _seller = Seller.fromJson(seller);
  }

  void setsellerFromModel(Seller seller) {
    _seller = seller;
    notifyListeners();
  }
}
