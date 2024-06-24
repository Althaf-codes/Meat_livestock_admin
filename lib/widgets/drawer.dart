// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../constants/Global_Variables.dart';

// class NavigationDrawer extends StatefulWidget {
//   NavigationDrawer({Key? key}) : super(key: key);

//   @override
//   State<NavigationDrawer> createState() => _NavigationDrawerState();
// }

// class _NavigationDrawerState extends State<NavigationDrawer> {
//   String? username;

//   String? phoneNumber;
//   String? userName;
//   String? phnNum;
//   @override
//   void initState() {
//     super.initState();
//     // setState(() {
//     //   username = BasicUserData().getUserName();
//     //   phoneNumber = BasicUserData().getPhoneNumber();
//     // });
//     getUserData();
//   }

//   void getUserData() async {
//     // final prefs = await SharedPreferences.getInstance();
//     // setState(() {
//     //   userName = prefs.getString("x-userName");
//     //   phnNum = prefs.getString("x-phoneNumber");
//     //   print('the name nd phno in setstae drawer file is $userName,$phnNum');
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final userName = user.getUserName().toString();
//     // final phnNum = user.getPhoneNumber().toString();
//     // print("the phnNum is ${widget.phnNum}");
//     // print("the userName is ${widget.userName}");

//     print('the sp  name in func is $userName');
//     print('the sp name in func is $phnNum');

//     ScrollController drawerScrollController = ScrollController();
//     return Material(
//       child: Drawer(
//         child: Container(
//             width: MediaQuery.of(context).size.width * 0.60,
//             color: GlobalVariables.selectedNavBarColor,
//             child: ListView(
//               controller: drawerScrollController,
//               children: [
//                 Container(
//                   color: Colors.white,
//                   height: MediaQuery.of(context).size.height * 0.40,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             TextButton(
//                                 style: TextButton.styleFrom(
//                                     shape: const RoundedRectangleBorder(),
//                                     side: BorderSide(
//                                       color:
//                                           GlobalVariables.selectedNavBarColor,
//                                     )),
//                                 onPressed: () {},
//                                 child: Stack(
//                                   clipBehavior: Clip.none,
//                                   children: [
//                                     Positioned(
//                                         top: -15,
//                                         right: -20,
//                                         child: Icon(
//                                           Icons.bookmark,
//                                           color: GlobalVariables
//                                               .selectedNavBarColor,
//                                         )),
//                                     Text(
//                                       'Buyer',
//                                       style: TextStyle(
//                                           color: GlobalVariables
//                                               .selectedNavBarColor),
//                                     ),
//                                   ],
//                                 ))
//                           ],
//                         ),
//                       ),
//                       CircleAvatar(
//                           backgroundColor: GlobalVariables.selectedNavBarColor,
//                           radius: 60,
//                           child: Text(userName?[0].toString() ?? '',
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 40,
//                                   fontWeight: FontWeight.bold))),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Text(userName ?? '',
//                           style: TextStyle(
//                               color: GlobalVariables.selectedNavBarColor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold)),
//                       const SizedBox(
//                         height: 3,
//                       ),
//                       Text(phnNum ?? '',
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 11,
//                           )),
//                       TextButton(
//                           style: TextButton.styleFrom(
//                               shape: const RoundedRectangleBorder(),
//                               side: BorderSide(
//                                 color: GlobalVariables.selectedNavBarColor,
//                               )),
//                           onPressed: () {},
//                           child: Text(
//                             'Switch to seller',
//                             style: TextStyle(
//                                 color: GlobalVariables.selectedNavBarColor),
//                           ))
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 buildMenuItem(
//                     text: 'All Categories',
//                     icon: Icons.category_outlined,
//                     ontap: () {
//                       selectedItem(context, 0);
//                     }),
//                 buildMenuItem(
//                     text: 'My Oders',
//                     icon: FontAwesomeIcons.firstOrder,
//                     ontap: () {
//                       selectedItem(context, 1);
//                     }),
//                 buildMenuItem(
//                     text: 'My Cart',
//                     icon: Icons.shopping_cart_checkout_outlined,
//                     ontap: () {
//                       selectedItem(context, 2);
//                     }),
//                 buildMenuItem(
//                     text: 'My Wishlist',
//                     icon: FontAwesomeIcons.gifts,
//                     ontap: () {
//                       selectedItem(context, 3);
//                     }),
//                 buildMenuItem(
//                     text: 'Offers',
//                     icon: Icons.discount_outlined,
//                     ontap: () {
//                       selectedItem(context, 4);
//                     }),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Divider(
//                     color: Colors.white54,
//                     thickness: 1,
//                   ),
//                 ),
//                 buildMenuItem(
//                     text: 'Trace Product',
//                     icon: FontAwesomeIcons.mapLocation,
//                     ontap: () {
//                       selectedItem(context, 5);
//                     }),
//                 buildMenuItem(
//                     text: 'Chats',
//                     icon: FontAwesomeIcons.message,
//                     ontap: () {
//                       selectedItem(context, 6);
//                     }),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Divider(
//                     color: Colors.white54,
//                     thickness: 1,
//                   ),
//                 ),
//                 buildMenuItem(
//                     text: 'Account',
//                     icon: Icons.account_box_outlined,
//                     ontap: () {
//                       selectedItem(context, 7);
//                     }),
//                 buildMenuItem(
//                     text: 'Notification',
//                     icon: Icons.notifications_outlined,
//                     ontap: () {
//                       selectedItem(context, 8);
//                     }),
//                 buildMenuItem(
//                     text: 'Settings',
//                     icon: Icons.settings_outlined,
//                     ontap: () {
//                       selectedItem(context, 9);
//                     }),
//                 buildMenuItem(
//                     text: 'Sign Out',
//                     icon: Icons.logout_outlined,
//                     ontap: () {
//                       selectedItem(context, 10);
//                     }),
//               ],
//             )),
//       ),
//     );
//   }

//   Widget buildMenuItem({
//     required String text,
//     required IconData icon,
//     required VoidCallback ontap,
//   }) {
//     return ListTile(
//       leading: Icon(
//         icon,
//         color: Colors.white, // GlobalVariables.selectedNavBarColor,
//       ),
//       title: Text(text,
//           style: const TextStyle(
//               color: Colors.white) // GlobalVariables.selectedNavBarColor),
//           ),
//       onTap: ontap,
//     );
//   }

//   void selectedItem(BuildContext context, int index) {
//     Navigator.pop(context);
//     switch (index) {
//       case 0:
//         Navigator.pushNamed(context, CategoryScreen.route);
//         break;
//       case 1:
//         Navigator.pushNamed(context, MyOrderScreen.route);
//         break;
//       case 2:
//         Navigator.pushNamed(context, CartScreen.route);
//         break;
//       case 3:
//         Navigator.pushNamed(context, MyWishListScreen.route);
//         break;
//       case 4:
//         Navigator.pushNamed(context, OfferScreen.route);
//         break;
//       case 5:
//         Navigator.pushNamed(context, TraceProductScreen.route);
//         break;
//       case 6:
//         Navigator.pushNamed(context, ChatScreen.route);
//         break;
//       case 7:
//         Navigator.pushNamed(context, AccountScreen.route);
//         break;
//       case 8:
//         Navigator.pushNamed(context, NotificationScreen.route);
//         break;
//       case 9:
//         Navigator.pushNamed(context, SettingScreen.route);
//         break;
//       case 10:
//         Navigator.pushNamed(context, SignOutScreen.route);
//         break;

//       default:
//     }
//   }
// }
