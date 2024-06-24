import 'package:flutter/material.dart';

class AddServiceTeamScreen extends StatelessWidget {
  const AddServiceTeamScreen({Key? key}) : super(key: key);
  static const String _route = '/AddServiceTeamScreen';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('AddServiceTeamScreen'),
      ),
    );
  }
}
