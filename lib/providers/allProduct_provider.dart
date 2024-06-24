import 'package:flutter/cupertino.dart';
import 'package:mq_admin/model/product_model.dart';
import 'package:mq_admin/services/product_service.dart';

import '../model/allProduct_model.dart';

class AllProductsProvider extends ChangeNotifier {
  ProductService productService = ProductService();
  // AllProduct _allProducts =
  //     productService.getallUnverifiedProducts(context: context);

  AllProduct _allProducts = AllProduct(allProducts: []);
  List<Product> _petCategory = [];
  List<Product> _cattleCategory = [];
  List<Product> _fishAndAquaticsCategory = [];
  List<Product> _birdsCategory = [];
  List<Product> _poultryCategory = [];
  List<Product> _accessoriesCategory = [];
  List<Product> _medicineCategory = [];
  List<Product> _toyCategory = [];
  List<Product> _meatCategory = [];
  List<Product> _feedCategory = [];
  AllProduct get allProducts => _allProducts;

  List<Product> get petCategory => _petCategory;
  List<Product> get cattleCategory => _cattleCategory;
  List<Product> get fishAndAquaticsCategory => _fishAndAquaticsCategory;
  List<Product> get birdsCategory => _birdsCategory;

  List<Product> get poultryCategory => _poultryCategory;

  List<Product> get accessoriesCategory => _accessoriesCategory;
  List<Product> get medicineCategory => _medicineCategory;
  List<Product> get toyCategory => _toyCategory;

  List<Product> get meatCategory => _meatCategory;
  List<Product> get feedCategory => _feedCategory;

  Future<void> setAllProducts(String allProduct) async {
    _allProducts = AllProduct.fromJson(allProduct);
    notifyListeners();
  }

  void setAllProductFromModel(AllProduct allProduct) {
    _allProducts = allProduct;

    _petCategory = allProducts.allProducts
        .where((element) => element.category.categoryName == 'pet')
        .toList();

    _cattleCategory = allProducts.allProducts
        .where((element) => element.category.categoryName == 'cattle')
        .toList();
    _fishAndAquaticsCategory = _allProducts.allProducts
        .where((element) => element.category.categoryName == 'fishAndAquatics')
        .toList();
    _birdsCategory = allProducts.allProducts
        .where((element) => element.category.categoryName == 'birds')
        .toList();
    _poultryCategory = allProducts.allProducts
        .where((element) => element.category.categoryName == 'poultry')
        .toList();
    _accessoriesCategory = _allProducts.allProducts
        .where((element) => element.category.categoryName == 'accessories')
        .toList();
    _medicineCategory = _allProducts.allProducts
        .where((element) => element.category.categoryName == 'medicine')
        .toList();
    _toyCategory = _allProducts.allProducts
        .where((element) => element.category.categoryName == 'toy')
        .toList();
    _meatCategory = _allProducts.allProducts
        .where((element) => element.category.categoryName == 'meat')
        .toList();
    _feedCategory = _allProducts.allProducts
        .where((element) => element.category.categoryName == 'feed')
        .toList();
    notifyListeners();
  }

  void removeProduct({required String id, required String category}) async {
    print(
        'the allProduct before length in provider is ${_allProducts.allProducts.length}');

    List<Product> myprods = allProducts.allProducts
        .where((element) => element.category.categoryName == category)
        .toList();

    for (var i = 0; i < myprods.length; i++) {
      print('the names are ${myprods[i].productName}');
      print('the category is ${myprods[i].category.categoryName}');
    }
    print('the myprods is ${myprods}');
    allProducts.allProducts
        .where((element) => element.category.categoryName == category)
        .toList()
        .removeWhere((element) => element.id == id);

    if (category == 'pet') {
      _petCategory.removeWhere((element) => element.id == id);
    }
    if (category == 'cattle') {
      _cattleCategory.removeWhere((element) => element.id == id);
    }
    print(
        'the allProduct after length  in provider is ${_allProducts.allProducts.length}');
    notifyListeners();
  }
}
