import 'package:flutter/material.dart';

import '../../constants/Global_Variables.dart';

class AdminAllStatisticsScreen extends StatelessWidget {
  const AdminAllStatisticsScreen({Key? key}) : super(key: key);

  static const String _route = '/AdminAllStatisticsScreen';

  static get route => _route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        title: const Text(
          'All Statistics',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(child: Text('AdminAllStatisticsScreen')),
    );
  }
}
