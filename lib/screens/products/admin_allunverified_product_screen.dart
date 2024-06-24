import 'package:flutter/material.dart';
import 'package:mq_admin/model/allProduct_model.dart';
import 'package:mq_admin/providers/allProduct_provider.dart';
import 'package:provider/provider.dart';

import '../../model/product_model.dart';
import '../../services/product_service.dart';
import '../../widgets/product_category_card.dart';

class AdminAllUnVerifiedProductScreen extends StatefulWidget {
  const AdminAllUnVerifiedProductScreen({Key? key}) : super(key: key);
  static const String _route = '/AdminAllUnVerifiedProductScreen';

  static get route => _route;

  @override
  State<AdminAllUnVerifiedProductScreen> createState() =>
      _AdminAllUnVerifiedProductScreenState();
}

class _AdminAllUnVerifiedProductScreenState
    extends State<AdminAllUnVerifiedProductScreen> {
  ProductService productService = ProductService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productService.getallUnverifiedProducts(context: context);
  }

  @override
  Widget build(BuildContext context) {
    ProductService productService = ProductService();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          FutureBuilder(
              future: productService.getallUnverifiedProducts(context: context),
              builder: (context, snapshot) {
                try {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Text('error occured'),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (!snapshot.hasData) {
                      return Container(
                        child: Text('No data'),
                      );
                    } else if (snapshot.hasData) {
                      return Consumer<AllProductsProvider>(
                          builder: (context, value, child) {
                        AllProduct data = value.allProducts;
                        print('the data is ${data}');
                        List<Product> petCategory = data.allProducts
                            .where((element) =>
                                element.category.categoryName == 'pet')
                            .toList();
                        List<Product> cattleCategory = data.allProducts
                            .where((element) =>
                                element.category.categoryName == 'cattle')
                            .toList();
                        List<Product> fishAndAquaticsCategory = data.allProducts
                            .where((element) =>
                                element.category.categoryName ==
                                'fishAndAquatics')
                            .toList();
                        List<Product> birdsCategory = data.allProducts
                            .where((element) =>
                                element.category.categoryName == 'birds')
                            .toList();
                        List<Product> poultryCategory = data.allProducts
                            .where((element) =>
                                element.category.categoryName == 'poultry')
                            .toList();
                        List<Product> accessoriesCategory = data.allProducts
                            .where((element) =>
                                element.category.categoryName == 'accessories')
                            .toList();
                        List<Product> medicineCategory = data.allProducts
                            .where((element) =>
                                element.category.categoryName == 'medicine')
                            .toList();
                        List<Product> toyCategory = data.allProducts
                            .where((element) =>
                                element.category.categoryName == 'toy')
                            .toList();
                        List<Product> meatCategory = data.allProducts
                            .where((element) =>
                                element.category.categoryName == 'meat')
                            .toList();
                        List<Product> feedCategory = data.allProducts
                            .where((element) =>
                                element.category.categoryName == 'feed')
                            .toList();

                        //   print('petCategory is ${petCategory.first}');
                        // print('cattelcatgeory is ${cattleCategory[0].productName}');
                        // // print(
                        // //     'fishCategory is ${fishAndAquaticsCategory[0].productName}');
                        // // print(
                        // //     'birdsCategory is ${birdsCategory[0].productName}');
                        // // print(
                        // //     'poultryCategory is ${poultryCategory[0].productName}');
                        // print(
                        //     'accessoriesCategory is ${accessoriesCategory[0].productName}');
                        // // print(
                        // //     'medicineCategory is ${medicineCategory[0].productName}');
                        // print('toyCategory is ${toyCategory[0].productName}');
                        // print('meatCategory is ${meatCategory[0].productName}');
                        // print('feedCategory is ${feedCategory[0].productName}');

                        return Column(
                          children: [
                            ProductCategoryCard(
                              allProducts: petCategory,
                              categoryName: 'Pets',
                            ),
                            ProductCategoryCard(
                              allProducts: cattleCategory,
                              categoryName: 'Cattles',
                            ),
                            ProductCategoryCard(
                              allProducts: poultryCategory,
                              categoryName: 'Poultry',
                            ),
                            ProductCategoryCard(
                              allProducts: birdsCategory,
                              categoryName: 'Birds',
                            ),
                            ProductCategoryCard(
                              allProducts: fishAndAquaticsCategory,
                              categoryName: 'FishAndAquatics',
                            ),
                            ProductCategoryCard(
                              allProducts: accessoriesCategory,
                              categoryName: 'Accessories',
                            ),
                            ProductCategoryCard(
                              allProducts: toyCategory,
                              categoryName: 'Toys',
                            ),
                            ProductCategoryCard(
                              allProducts: medicineCategory,
                              categoryName: 'Medicine',
                            ),
                            ProductCategoryCard(
                              allProducts: feedCategory,
                              categoryName: 'Feed',
                            ),
                          ],
                        );
                      });
                    } else {
                      return Text('Something went wrong');
                    }
                  } else {
                    return Text('Something went wrong');
                  }
                } on Exception catch (e) {
                  return SizedBox(
                    child: Text('the error is ${e.toString()}'),
                  );
                }
              })

          // FutureBuilder(
          //     initialData: 'Dummy Data',
          //     future: productService.getallUnverifiedProducts(context: context),
          //     builder: (context, AsyncSnapshot snapshot) {
          //       try {
          //         if (snapshot.connectionState == ConnectionState.waiting) {
          //           return const Center(
          //             child: CircularProgressIndicator(),
          //           );
          //         } else if (snapshot.hasError) {
          //           return Container(
          //             child: Text('error occured'),
          //           );
          //         } else if (snapshot.connectionState == ConnectionState.done) {
          //           if (!snapshot.hasData) {
          //             return Container(
          //               child: Text('No data'),
          //             );
          //           } else if (snapshot.hasData) {
          //             List<Product> data = snapshot.data;
          //             List<Product> petCategory = data
          //                 .where((element) =>
          //                     element.category.categoryName == 'pet')
          //                 .toList();
          //             List<Product> cattleCategory = data
          //                 .where((element) =>
          //                     element.category.categoryName == 'cattle')
          //                 .toList();
          //             List<Product> fishAndAquaticsCategory = data
          //                 .where((element) =>
          //                     element.category.categoryName ==
          //                     'fishAndAquatics')
          //                 .toList();
          //             List<Product> birdsCategory = data
          //                 .where((element) =>
          //                     element.category.categoryName == 'birds')
          //                 .toList();
          //             List<Product> poultryCategory = data
          //                 .where((element) =>
          //                     element.category.categoryName == 'poultry')
          //                 .toList();
          //             List<Product> accessoriesCategory = data
          //                 .where((element) =>
          //                     element.category.categoryName == 'accessories')
          //                 .toList();
          //             List<Product> medicineCategory = data
          //                 .where((element) =>
          //                     element.category.categoryName == 'medicine')
          //                 .toList();
          //             List<Product> toyCategory = data
          //                 .where((element) =>
          //                     element.category.categoryName == 'toy')
          //                 .toList();
          //             List<Product> meatCategory = data
          //                 .where((element) =>
          //                     element.category.categoryName == 'meat')
          //                 .toList();
          //             List<Product> feedCategory = data
          //                 .where((element) =>
          //                     element.category.categoryName == 'feed')
          //                 .toList();

          //             // print(
          //             //     'petCategory is ${petCategory[0].category.categoryName}');
          //             // print(
          //             //     'cattelcatgeory is ${cattleCategory[0].productName}');
          //             // // print(
          //             // //     'fishCategory is ${fishAndAquaticsCategory[0].productName}');
          //             // // print(
          //             // //     'birdsCategory is ${birdsCategory[0].productName}');
          //             // // print(
          //             // //     'poultryCategory is ${poultryCategory[0].productName}');
          //             // print(
          //             //     'accessoriesCategory is ${accessoriesCategory[0].productName}');
          //             // // print(
          //             // //     'medicineCategory is ${medicineCategory[0].productName}');
          //             // print('toyCategory is ${toyCategory[0].productName}');
          //             // print('meatCategory is ${meatCategory[0].productName}');
          //             // print('feedCategory is ${feedCategory[0].productName}');

          //             return Column(
          //               children: [
          //                 ProductCategoryCard(
          //                   allProducts: petCategory,
          //                   categoryName: 'Pets',
          //                 ),
          //                 ProductCategoryCard(
          //                   allProducts: cattleCategory,
          //                   categoryName: 'Cattles',
          //                 ),
          //                 ProductCategoryCard(
          //                   allProducts: poultryCategory,
          //                   categoryName: 'Poultry',
          //                 ),
          //                 ProductCategoryCard(
          //                   allProducts: birdsCategory,
          //                   categoryName: 'Birds',
          //                 ),
          //                 ProductCategoryCard(
          //                   allProducts: fishAndAquaticsCategory,
          //                   categoryName: 'FishAndAquatics',
          //                 ),
          //                 ProductCategoryCard(
          //                   allProducts: accessoriesCategory,
          //                   categoryName: 'Accessories',
          //                 ),
          //                 ProductCategoryCard(
          //                   allProducts: toyCategory,
          //                   categoryName: 'Toys',
          //                 ),
          //                 ProductCategoryCard(
          //                   allProducts: medicineCategory,
          //                   categoryName: 'Medicine',
          //                 ),
          //                 ProductCategoryCard(
          //                   allProducts: feedCategory,
          //                   categoryName: 'Feed',
          //                 ),
          //               ],
          //             );
          //           } else {
          //             return Text('Something went wrong');
          //           }
          //         } else {
          //           return Text('Something went wrong');
          //         }
          //       } on Exception catch (e) {
          //         return SizedBox(
          //           child: Text('the error is ${e.toString()}'),
          //         );
          //       }
          //     })
        ],
      ),
    );
  }
}
