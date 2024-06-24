import 'package:flutter/material.dart';

class AddSellerScreen extends StatelessWidget {
  const AddSellerScreen({Key? key}) : super(key: key);
  static const String _route = '/AddSellerScreen';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('AddSellerScreen'),
      ),
    );
  }
}
