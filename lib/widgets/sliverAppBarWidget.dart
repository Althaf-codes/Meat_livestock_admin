import 'package:flutter/material.dart';
import 'package:mq_admin/constants/Global_Variables.dart';

Widget sliverAppBar(BuildContext context,
    {String title = 'Mq',
    IconData icon2 = Icons.mic,
    bool isSecondIcon = false,
    required Widget icon1,
    required Widget flexibleChild}) {
  return SliverAppBar(
    expandedHeight: 100,
    // automaticallyImplyLeading: false,
    pinned: true,
    floating: true,
    titleSpacing: 1,
    backgroundColor: GlobalVariables.selectedNavBarColor,
    elevation: 1.0,
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          title.toString(),
          style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
    ),
    actions: [
      icon1,
      isSecondIcon
          ? Container(
              color: Colors.transparent,
              height: 42,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(icon2, color: Colors.black, size: 25))
          : Container()
    ],

    flexibleSpace: FlexibleSpaceBar(background: flexibleChild),
  );
}
