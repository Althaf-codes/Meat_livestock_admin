import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mq_admin/screens/admin_allorders_screen.dart';

import 'package:mq_admin/screens/sellers/admin_allsellers_screen.dart';
import 'package:mq_admin/screens/admin_statistics_screen.dart';
import 'package:mq_admin/screens/admins_add_deals_screen.dart';
import 'package:mq_admin/screens/products/admin_allproducts_screen.dart';

import 'constants/Global_Variables.dart';
import 'widgets/ScrollToHideWidget.dart';
import 'widgets/drawer.dart';

class AdminMainHomePage extends StatefulWidget {
  const AdminMainHomePage({Key? key}) : super(key: key);

  static const String _route = '/AdminMainHomePage';

  static get route => _route;
  @override
  State<AdminMainHomePage> createState() => _AdminMainHomePageState();
}

class _AdminMainHomePageState extends State<AdminMainHomePage> {
  int _currentIndex = 0;
  bool isFab = false;
  bool isBottom = true;
  ScrollController bottomScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      AdminAllProductsScreen(),
      AdminAllOrdersScreen(),
      AdminAllStatisticsScreen(),
      AdminAllSellersScreen()
    ];
    // bool isPost = false;
    // bool true;
    return Scaffold(
      // drawer: NavigationDrawer(),
      resizeToAvoidBottomInset: false,
      body: isFab ? const AdminAddDealsScreen() : screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isFab
          ? ScrollToHideWidget(
              controller: bottomScrollController,
              child: FloatingActionButton.extended(
                  onPressed: () {
                    if (isFab == true) return;
                    if (isFab == false) {
                      setState(() {
                        isFab = true;
                      });
                    }
                  },
                  tooltip: 'Deals',
                  icon: const Icon(FontAwesomeIcons.telegram),
                  label: const Text(
                    "Deals",
                  ),
                  backgroundColor: GlobalVariables.selectedNavBarColor),
            )
          : ScrollToHideWidget(
              controller: bottomScrollController,
              child: FloatingActionButton(
                onPressed: () {
                  if (isFab == true) return;
                  if (isFab == false) {
                    setState(() {
                      isFab = true;
                    });
                  }
                },
                backgroundColor:
                    isFab ? GlobalVariables.selectedNavBarColor : Colors.white,
                tooltip: 'Deals',
                child: Icon(
                  Icons.add_outlined,
                  color: isFab
                      ? Colors.white
                      : GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),
      bottomNavigationBar: ScrollToHideWidget(
        controller: bottomScrollController,
        child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFab = false;
                        _currentIndex = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.border_all_rounded,
                            color: _currentIndex == 0 && !isFab
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.unselectedNavBarColor,
                            size: _currentIndex == 0 && !isFab ? 28 : 24,
                          ),
                          Text(
                            _currentIndex == 0 && !isFab ? 'Products' : '',
                            style: TextStyle(
                                color: _currentIndex == 0 && !isFab
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.unselectedNavBarColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFab = false;
                        _currentIndex = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.category_outlined,
                            color: _currentIndex == 1 && !isFab
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.unselectedNavBarColor,
                            size: _currentIndex == 1 && !isFab ? 28 : 24,
                          ),
                          Text(
                            _currentIndex == 1 && !isFab ? 'All Orders' : '',
                            style: TextStyle(
                                color: _currentIndex == 1 && !isFab
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.unselectedNavBarColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFab = false;
                        _currentIndex = 2;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.bar_chart_outlined,
                            color: _currentIndex == 2 && !isFab
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.unselectedNavBarColor,
                            size: _currentIndex == 2 && !isFab ? 28 : 24,
                          ),
                          Text(
                            _currentIndex == 2 && !isFab ? 'Satistics' : '',
                            style: TextStyle(
                                color: _currentIndex == 2 && !isFab
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.unselectedNavBarColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      setState(() {
                        isFab = false;
                        _currentIndex = 3;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_outline_outlined,
                            color: _currentIndex == 3 && !isFab
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.unselectedNavBarColor,
                            size: _currentIndex == 3 && !isFab ? 28 : 24,
                          ),
                          Text(
                            _currentIndex == 3 && !isFab ? 'Sellers' : '',
                            style: TextStyle(
                                color: _currentIndex == 3 && !isFab
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.unselectedNavBarColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  // const Icon(Icons.category_outlined),
                  // const Icon(Icons.account_circle_rounded),
                  // const Icon(Icons.shopping_cart_checkout_outlined),
                ],
              ),
            )),
      ),
    );
  }
}
