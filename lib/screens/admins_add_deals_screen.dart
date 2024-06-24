import 'package:flutter/material.dart';

import '../../constants/Global_Variables.dart';

class AdminAddDealsScreen extends StatelessWidget {
  const AdminAddDealsScreen({Key? key}) : super(key: key);

  static const String _route = '/AdminAddDealsScreen';

  static get route => _route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        title: const Text(
          'Add Deals',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(child: Text('AdminAddDealsScreen')),
    );
  }
}
