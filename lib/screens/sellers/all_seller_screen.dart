import 'package:flutter/material.dart';
import 'package:mq_admin/services/auth_service.dart';

import '../../model/seller_model.dart';
import '../../model/serviceTeam_model.dart';

class AllSellerScreen extends StatefulWidget {
  const AllSellerScreen({Key? key}) : super(key: key);
  static const String _route = '/AllSellerScreen';

  static get route => _route;

  @override
  State<AllSellerScreen> createState() => _AllSellerScreenState();
}

class _AllSellerScreenState extends State<AllSellerScreen> {
  AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getAllSellers(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                initialData: 'Dummy Data',
                future: authService.getAllSellers(context: context),
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
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
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
                                  Seller sellers = snapshot.data[index];
                                  return ListTile(
                                    title: Text(sellers.sellerName),
                                    subtitle: Text(sellers.phoneNumber),
                                    trailing: Wrap(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.blue,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ),
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
      ),
    );
  }
}
