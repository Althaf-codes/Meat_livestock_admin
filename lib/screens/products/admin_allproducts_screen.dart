import 'package:flutter/material.dart';
import 'package:mq_admin/screens/products/admin_allunverified_product_screen.dart';
import 'package:mq_admin/screens/products/admin_allverified_product_screen.dart';

import '../../constants/Global_Variables.dart';
import '../../model/allProduct_model.dart';

import '../../providers/allProduct_provider.dart';
import '../../services/auth_service.dart';
import '../../services/product_service.dart';
import '../../widgets/sliverAppBarWidget.dart';

class AdminAllProductsScreen extends StatefulWidget {
  const AdminAllProductsScreen({Key? key}) : super(key: key);

  static const String _route = '/AdminAllProductsScreen';

  static get route => _route;

  @override
  State<AdminAllProductsScreen> createState() => _AdminAllProductsScreenState();
}

class _AdminAllProductsScreenState extends State<AdminAllProductsScreen> {
  AllProduct allProducts = AllProduct(allProducts: []);
  ProductService productService = ProductService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  productService.getallUnverifiedProducts(context: context);
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    ProductService productService = ProductService();
    AllProductsProvider allProductsProvider = AllProductsProvider();
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          // appBar: AppBar(
          //   elevation: 200,
          //   title: const Text('AllProducts'),
          //   backgroundColor: GlobalVariables.selectedNavBarColor,
          //   bottom: const PreferredSize(
          //     preferredSize: Size.fromHeight(60),
          //     child: Flexible(
          //         flex: 1,
          //         child: TabBar(indicatorColor: Colors.black, tabs: [
          //           Tab(
          //             icon: Icon(Icons.verified_outlined),
          //             text: 'Verified',
          //           ),
          //           Tab(
          //             icon: Icon(Icons.unpublished),
          //             text: 'UnVerified',
          //           ),
          //         ])),
          //   ),
          // ),
          // body: const TabBarView(
          //   children: [
          //     AdminAllVerifiedProductScreen(),
          //     AdminAllUnVerifiedProductScreen()
          //   ],
          // )),
          body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  sliverAppBar(context,
                      title: '',
                      icon1: IconButton(
                        onPressed: () {
                          // showSearch(context: context, delegate: MySearchDelegate());
                        },
                        icon: const Icon(Icons.search,
                            color: Colors.black, size: 25),
                      ),
                      flexibleChild:
                          const TabBar(indicatorColor: Colors.black, tabs: [
                        Tab(
                          icon: Icon(Icons.verified_outlined),
                          text: 'Verified',
                        ),
                        Tab(
                          icon: Icon(Icons.unpublished),
                          text: 'UnVerified',
                        ),
                      ]))
                ];
              },
              body: const TabBarView(
                children: [
                  AdminAllVerifiedProductScreen(),
                  AdminAllUnVerifiedProductScreen()
                ],
              )),
        ));
  }
}
