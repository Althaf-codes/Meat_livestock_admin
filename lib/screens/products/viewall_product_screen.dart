import 'package:flutter/material.dart';
import 'package:mq_admin/constants/Global_Variables.dart';
import 'package:mq_admin/screens/products/detailed_product_screen.dart';

import '../../model/product_model.dart';

class ViewAllProductScreen extends StatelessWidget {
  List<Product> allProducts;
  ViewAllProductScreen({Key? key, required this.allProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int prodlen = allProducts.length;
    print('the prod len is ${prodlen}');
    return Scaffold(
      appBar: AppBar(
          backgroundColor: GlobalVariables.selectedNavBarColor,
          title: const Text(
            'All Products',
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
                separatorBuilder: ((context, index) => Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.green,
                      height: 5,
                      thickness: 1,
                    )),
                shrinkWrap: true,
                itemCount: prodlen == 0 || prodlen == null ? 0 : prodlen,
                itemBuilder: (context, index) {
                  Product product = allProducts[index];
                  // Product product = prodlen == 0
                  //     ? Product(
                  //         id: '',
                  //         productName: '',
                  //         description: '',
                  //         highlightDescription: '',
                  //         elaborateDescription: '',
                  //         images: [],
                  //         quantity: 0,
                  //         isHavingStock: false,
                  //         stockQuantity: 0,
                  //         price: 0,
                  //         isVerified: false,
                  //         sellerId: '',
                  //         buyers: [],
                  //         isDiscountable: false,
                  //         discount: 0,
                  //         category: Category(
                  //             categoryName: '',
                  //             pet: '',
                  //             cattle: '',
                  //             accessories: '',
                  //             toy: '',
                  //             meat: '',
                  //             feed: '',
                  //             birds: '',
                  //             fishAndAquatics: '',
                  //             poultry: '',
                  //             medicine: ''),
                  //         ratings: [],
                  //         feedback: [],
                  //         isDeliverable: false,
                  //         deliverablespan: [])
                  //     : index <= prodlen - 1
                  //         ? allProducts[index]
                  //         : Product(
                  //             id: '',
                  //             productName: '',
                  //             description: '',
                  //             highlightDescription: '',
                  //             elaborateDescription: '',
                  //             images: [],
                  //             quantity: 0,
                  //             isHavingStock: false,
                  //             stockQuantity: 0,
                  //             price: 0,
                  //             isVerified: false,
                  //             sellerId: '',
                  //             buyers: [],
                  //             isDiscountable: false,
                  //             discount: 0,
                  //             category: Category(
                  //                 categoryName: '',
                  //                 pet: '',
                  //                 cattle: '',
                  //                 accessories: '',
                  //                 toy: '',
                  //                 meat: '',
                  //                 feed: '',
                  //                 birds: '',
                  //                 fishAndAquatics: '',
                  //                 poultry: '',
                  //                 medicine: ''),
                  //             ratings: [],
                  //             feedback: [],
                  //             isDeliverable: false,
                  //             deliverablespan: []);
                  return prodlen == 0
                      ? Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'No products in this category',
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                        )
                      : index <= prodlen - 1
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (route) =>
                                            DetailedProductScreen(
                                              index: index,
                                              product: product,
                                            )));
                              },
                              child: ListTile(
                                leading:
                                    CircleAvatar(backgroundColor: Colors.green),
                                title: Text('${product.productName}'),
                                subtitle: Text('${product.description}'),
                                trailing: Wrap(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.center,
                              child: Text(
                                'No products in this category',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24),
                              ));
                }),
          ],
        ),
      ),
    );
  }
}
