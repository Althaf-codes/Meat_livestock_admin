import 'package:flutter/material.dart';

import '../../constants/Global_Variables.dart';

class AdminAllOrdersScreen extends StatelessWidget {
  const AdminAllOrdersScreen({Key? key}) : super(key: key);

  static const String _route = '/AdminAllOrdersScreen';

  static get route => _route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        title: const Text(
          'All Orders',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(child: Text('AdminAllOrdersScreen')),
    );
  }
}
