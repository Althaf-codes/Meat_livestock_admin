import 'package:flutter/material.dart';
import 'package:mq_admin/screens/products/viewall_product_screen.dart';

import '../constants/Global_Variables.dart';
import '../model/product_model.dart';

class ProductCategoryCard extends StatelessWidget {
  String categoryName;
  List<Product> allProducts;
  ProductCategoryCard(
      {Key? key, required this.allProducts, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int prodlen = allProducts.length;
    // print('the prodlen is ${prodlen}');
    return GestureDetector(
      onTap: () {
        prodlen == 0
            ? null
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (route) => ViewAllProductScreen(
                          allProducts: allProducts,
                        )));
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 254, 244, 174),
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(categoryName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  prodlen == 0
                      ? Container()
                      : ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: GlobalVariables.selectedNavBarColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('View More',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: 18,
                              )
                            ],
                          ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                //color: Colors.red,
                // height: 320,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    // clipBehavior: Clip.none,
                    shrinkWrap: true,
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      Product product = prodlen == 0
                          ? Product(
                              id: '',
                              productName: '',
                              description: '',
                              highlightDescription: '',
                              elaborateDescription: '',
                              images: [],
                              quantity: 0,
                              isHavingStock: false,
                              stockQuantity: 0,
                              price: 0,
                              isVerified: false,
                              sellerId: '',
                              buyers: [],
                              isDiscountable: false,
                              discount: 0,
                              category: Category(
                                  categoryName: '',
                                  pet: '',
                                  cattle: '',
                                  accessories: '',
                                  toy: '',
                                  meat: '',
                                  feed: '',
                                  birds: '',
                                  fishAndAquatics: '',
                                  poultry: '',
                                  medicine: ''),
                              ratings: [],
                              feedback: [],
                              isDeliverable: false,
                              deliverablespan: [])
                          : index <= prodlen - 1
                              ? allProducts[index]
                              : Product(
                                  id: '',
                                  productName: '',
                                  description: '',
                                  highlightDescription: '',
                                  elaborateDescription: '',
                                  images: [],
                                  quantity: 0,
                                  isHavingStock: false,
                                  stockQuantity: 0,
                                  price: 0,
                                  isVerified: false,
                                  sellerId: '',
                                  buyers: [],
                                  isDiscountable: false,
                                  discount: 0,
                                  category: Category(
                                      categoryName: '',
                                      pet: '',
                                      cattle: '',
                                      accessories: '',
                                      toy: '',
                                      meat: '',
                                      feed: '',
                                      birds: '',
                                      fishAndAquatics: '',
                                      poultry: '',
                                      medicine: ''),
                                  ratings: [],
                                  feedback: [],
                                  isDeliverable: false,
                                  deliverablespan: []);
                      return prodlen == 0
                          ? Container(
                              height: MediaQuery.of(context).size.height * 0.16,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black)),
                              child: const Center(child: Text('---')),
                            )
                          : index <= prodlen - 1
                              ? Center(
                                  child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.black)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.16,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/category/chicken-leg.png'))),
                                      ),
                                      Text(product.productName,
                                          maxLines: 2,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.grey[500],
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600)),
                                      Text(product.description,
                                          maxLines: 2,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.green,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                ))
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.16,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.black)),
                                  child: const Center(child: Text('---')),
                                );
                    }),
              )
            ],
          )),
    );
  }
}
