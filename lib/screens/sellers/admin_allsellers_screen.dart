import 'package:flutter/material.dart';
import 'package:mq_admin/screens/sellers/add_seller_screen.dart';
import 'package:mq_admin/screens/sellers/add_service_team_screen.dart';
import 'package:mq_admin/screens/sellers/all_seller_screen.dart';
import 'package:mq_admin/screens/sellers/all_service_team_screen.dart';

import '../../../constants/Global_Variables.dart';
import '../../widgets/sliverAppBarWidget.dart';

class AdminAllSellersScreen extends StatelessWidget {
  const AdminAllSellersScreen({Key? key}) : super(key: key);

  static const String _route = '/AdminAllSellersScreen';

  static get route => _route;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                        text: '+ Team',
                      ),
                      Tab(
                        icon: Icon(Icons.unpublished),
                        text: '+ Seller',
                      ),
                      Tab(
                        icon: Icon(Icons.unpublished),
                        text: 'Team',
                      ),
                      Tab(
                        icon: Icon(Icons.unpublished),
                        text: 'Seller',
                      ),
                    ]))
              ];
            },
            body: const TabBarView(
              children: [
                AddServiceTeamScreen(),
                AddSellerScreen(),
                AllServiceTeamScreen(),
                AllSellerScreen(),
              ],
            )),
      ),
    );
  }
}
