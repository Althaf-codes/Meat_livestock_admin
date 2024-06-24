import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mq_admin/constants/Global_Variables.dart';
import 'package:mq_admin/model/product_model.dart';
import 'package:mq_admin/providers/allProduct_provider.dart';
import 'package:mq_admin/screens/products/admin_allunverified_product_screen.dart';
import 'package:mq_admin/services/product_service.dart';
import 'package:provider/provider.dart';

import '../../widgets/horizontal_text_title.dart';

class DetailedProductScreen extends StatelessWidget {
  int index;
  Product product;
  DetailedProductScreen({Key? key, required this.index, required this.product})
      : super(key: key);

  @override
  build(BuildContext context) {
    ProductService productService = ProductService();
    const textStyle = TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        wordSpacing: 3);

    const seeAllStyle = TextStyle(
        color: Color.fromARGB(255, 6, 81, 143),
        fontSize: 14,
        fontWeight: FontWeight.w800);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        title: const Text(
          'Detailed product screen',
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: Colors.blue,
                image:
                    DecorationImage(image: NetworkImage(''), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  HorizontalTitleText(
                      title: 'ProductID', text: product.id.toString()),
                  const SizedBox(
                    height: 15,
                  ),
                  HorizontalTitleText(
                      title: 'Product Name', text: product.productName),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${product.description} (${product.highlightDescription})',
                    //  homedata.owner,
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("ABOUT",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    product.elaborateDescription,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 131, 130, 130),
                        wordSpacing: 2,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HorizontalTitleText(
                      title: 'ratings',
                      text: product.ratings.length.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'price', text: product.price.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'quantity', text: product.quantity.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'isHavingStock',
                      text: product.isHavingStock == true ? 'Yes' : 'No'),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'stockQuantity',
                      text: product.stockQuantity.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'isVerified',
                      text: product.isVerified == true ? 'Yes' : 'No'),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'sellerID', text: product.sellerId),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'buyers', text: product.buyers.length.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'isDiscountable',
                      text: product.isDiscountable == true ? 'Yes' : 'No'),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'category', text: product.category.categoryName),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'feedback',
                      text: product.feedback.length.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'isDeliverable',
                      text: product.isDeliverable == true ? 'Yes' : 'No'),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalTitleText(
                      title: 'deliverablespan',
                      text: product.deliverablespan.length.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: GlobalVariables.selectedNavBarColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            size: 14,
                          ),
                          label: const Text(
                            'Edit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            size: 14,
                          ),
                          label: const Text(
                            'Delete',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )),
                      product.isVerified == true
                          ? Container()
                          : ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                productService.verifyProduct(
                                    context: context, productID: product.id);

                                Provider.of<AllProductsProvider>(context,
                                        listen: false)
                                    .removeProduct(
                                        id: product.id,
                                        category:
                                            product.category.categoryName);

                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.verified_outlined,
                                size: 14,
                              ),
                              label: const Text(
                                'Verify',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
