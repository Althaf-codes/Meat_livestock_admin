// import 'package:flutter/cupertino.dart';
// import 'package:mq_admin/model/serviceTeam_model.dart';

// import '../model/allProduct_model.dart';

// class ServiceTeamProvider extends ChangeNotifier {
//   AllProduct _allProducts = AllProduct(allProducts: []);

//   Future<ServiceTeam> get  async => _allProducts;
//   void setAllProducts(String allProduct) {
//     _allProducts = AllProduct.fromJson(allProduct);
//   }

//   void setAllProductFromModel(AllProduct allProduct) {
//     _allProducts = allProduct;
//     notifyListeners();
//   }

//   Future<void> removeProduct(int index) async {
//     _allProducts.allProducts.removeAt(index);
//   }
// }
