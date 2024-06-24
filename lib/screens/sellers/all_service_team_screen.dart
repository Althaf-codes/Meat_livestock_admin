import 'package:flutter/material.dart';
import 'package:mq_admin/services/auth_service.dart';

import '../../model/serviceTeam_model.dart';

class AllServiceTeamScreen extends StatefulWidget {
  const AllServiceTeamScreen({Key? key}) : super(key: key);
  static const String _route = '/AllServiceTeamScreen';

  static get route => _route;

  @override
  State<AllServiceTeamScreen> createState() => _AllServiceTeamScreenState();
}

class _AllServiceTeamScreenState extends State<AllServiceTeamScreen> {
  AuthService authService = AuthService();
  // bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              initialData: 'Dummy Data',
              future: authService.getAllServiceTeam(context: context),
              builder: (context, AsyncSnapshot snapshot) {
                try {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Text('error occured'),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (!snapshot.hasData) {
                      return Container(
                        child: Text('No data'),
                      );
                    } else if (snapshot.hasData) {
                      return Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                ServiceTeam serviceTeam = snapshot.data[index];
                                return ExpansionTile(
                                  title: Text(serviceTeam.teamAdminName),
                                  subtitle: Text(serviceTeam.teamRole),
                                  // trailing: Icon(
                                  //   _customTileExpanded
                                  //       ? Icons.arrow_drop_down_circle
                                  //       : Icons.arrow_drop_down,
                                  // ),
                                  children: <Widget>[
                                    Container(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              serviceTeam.teamMembers!.length,
                                          itemBuilder: (context, index) {
                                            TeamMembers teamMembers =
                                                serviceTeam.teamMembers![index];
                                            return ListTile(
                                              title:
                                                  Text(teamMembers.memberName),
                                              subtitle: Text(teamMembers
                                                  .memberPhoneNumber),
                                            );
                                          }),
                                    )
                                  ],
                                  onExpansionChanged: (bool expanded) {
                                    // setState(
                                    //     () => _customTileExpanded = expanded);
                                  },
                                );
                              })
                        ],
                      );
                    } else {
                      return Text('Something went wrong');
                    }
                  } else {
                    return Text('Something went wrong');
                  }
                } on Exception catch (e) {
                  return SizedBox(
                    child: Text('the error is ${e.toString()}'),
                  );
                }
              })
        ],
      ),
    );
  }
}
