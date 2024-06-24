import 'package:flutter/material.dart';
import 'package:mq_admin/AdminMainHomePage.dart';
import 'package:mq_admin/providers/allProduct_provider.dart';

import 'package:mq_admin/providers/mainadmin_provider.dart';
import 'package:mq_admin/screens/admin_allorders_screen.dart';
import 'package:mq_admin/screens/products/admin_allproducts_screen.dart';

import 'package:mq_admin/screens/admin_statistics_screen.dart';
import 'package:mq_admin/screens/admins_add_deals_screen.dart';
import 'package:mq_admin/screens/products/admin_allunverified_product_screen.dart';
import 'package:mq_admin/screens/products/admin_allverified_product_screen.dart';
import 'package:mq_admin/screens/sellers/admin_allsellers_screen.dart';

import 'package:mq_admin/services/auth_service.dart';
import 'package:mq_admin/widgets/toggle.dart';
import 'package:provider/provider.dart';

import 'constants/Global_Variables.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MainAdminProvider()),
    ChangeNotifierProvider(create: (_) => AllProductsProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();
  // String? adminName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    authService.getMainAdminDetails(context);
    // getdata(context);
  }

  // void getdata(BuildContext context) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     adminName = prefs.getString("x-mainAdminName");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
    return MaterialApp(
        scaffoldMessengerKey: _scaffoldKey,
        debugShowCheckedModeBanner: false,
        title: 'MQ Admin',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.greyBackgroundCOlor,
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        ),
        routes: {
          Toggle.route: (context) => const Toggle(),
          AdminMainHomePage.route: (context) => const AdminMainHomePage(),
          AdminAllProductsScreen.route: (context) =>
              const AdminAllProductsScreen(),
          AdminAllOrdersScreen.route: (context) => const AdminAllOrdersScreen(),
          AdminAddDealsScreen.route: (context) => const AdminAddDealsScreen(),
          AdminAllStatisticsScreen.route: (context) =>
              const AdminAllStatisticsScreen(),
          AdminAllSellersScreen.route: (context) =>
              const AdminAllSellersScreen(),
          AdminAllUnVerifiedProductScreen.route: (context) =>
              const AdminAllVerifiedProductScreen(),
          AdminAllVerifiedProductScreen.route: (context) =>
              const AdminAllVerifiedProductScreen()
        },
        home: const AuthWrapper());
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Provider.of<MainAdminProvider>(context)
        .mainAdmin
        .mainAdminName
        .isEmpty) {
      return const Toggle();
    } else {
      return const AdminMainHomePage();
    }
  }
}
