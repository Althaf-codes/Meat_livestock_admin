import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mq_admin/AdminMainHomePage.dart';
import 'package:mq_admin/constants/Global_Variables.dart';
import 'package:mq_admin/model/mainAdmin_model.dart';
import 'package:http/http.dart' as http;
import 'package:mq_admin/model/seller_model.dart';
import 'package:mq_admin/model/serviceTeam_model.dart';
import 'package:mq_admin/providers/mainadmin_provider.dart';
import 'package:mq_admin/widgets/toggle.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/snackbar.dart';
import '../constants/errror_handling.dart';

class AuthService {
  void signUpAdmin({
    required BuildContext context,
    required String phoneNumber,
    required String password1,
    required String password2,
    required String mainAdminName,
  }) async {
    try {
      MainAdmin mainAdmin = MainAdmin(
          mainAdminName: mainAdminName,
          mainAdminPhoneNumber: phoneNumber,
          mainAdminPassword1: password1,
          mainAdminPassword2: password2);

      http.Response res = await http.post(
        Uri.parse('$uri/api/mainAdmin/signUp'),
        body: mainAdmin.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final mainAdminRes = jsonDecode(res.body);
      print('the mainAdminRes is ${mainAdminRes}');

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            await prefs.setString(
                "x-mainAdminName", mainAdminRes['mainAdmin']['mainAdminName']);
            await prefs.setString("x-mainAdminPhoneNumber",
                mainAdminRes['mainAdmin']['mainAdminPhoneNumber']);
            await prefs.setString(
                'x-mainAdminAuth-token', mainAdminRes['token']);
            Navigator.pushNamedAndRemoveUntil(
              context,
              AdminMainHomePage.route,
              ((route) => false),
            );
            showSnackBar(context, 'Account created! Successfully');
          });
    } catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
    }
  }

  void mainAdminSignIn(
      {required BuildContext context,
      required phoneNumber,
      required password1,
      required password2}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/mainAdmin/signIn'),
        body: jsonEncode({
          'password1': password1,
          'password2': password2,
          'phoneNumber': phoneNumber
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      var user = jsonDecode(res.body);

      print('the user is $user ');
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          await prefs.setString(
              "x-mainAdminName", user['mainAdminDetails']['mainAdminName']);
          await prefs.setString("x-mainAdminPhoneNumber",
              user['mainAdminDetails']['mainAdminPhoneNumber']);
          await prefs.setString("x-mainAdminAuth-token", user['token']);

          Navigator.pushNamedAndRemoveUntil(
            context,
            AdminMainHomePage.route,
            (route) => false,
          );
        },
      );
    } catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
    }
  }

  void getMainAdminDetails(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? mainAdmintoken = prefs.getString("x-mainAdminAuth-token");
      print('the mainAdmintoken is ${mainAdmintoken}');
      print('its coming1');
      if (mainAdmintoken == null) {
        prefs.setString('x-mainAdminAuth-token', '');
      }
      print('its coming2');
      var tokenRes = await http.get(Uri.parse('$uri/api/getmainAdminById'),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'x-mainAdminAuth-token': mainAdmintoken!,
          });

      print('its coming3');
      print('the tokenRes is ${jsonDecode(tokenRes.body)}');
      var response = jsonDecode(tokenRes.body);
      print('the response is $response');

      var mainAdminProvider =
          Provider.of<MainAdminProvider>(context, listen: false);
      print('its coming4');
      if (response['isTrue'] == true) {
        print('its coming inside');
        prefs.setString("x-mainAdminName", response['mainAdminName']);
        prefs.setString(
            "x-mainAdminPhoneNumber", response['mainAdminPhoneNumber']);
        prefs.setString('x-mainAdminAuth-token', response['token']);
        mainAdminProvider.setMainAdmin(tokenRes.body);
      }
      print('the responsetoken is ${response['token']}');
      print('its coming5');
    } catch (e) {
      print('Error occured in getMainAdminDetails');
      print(e.toString());
    }
  }

  void signOutMainAdmin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("x-mainAdminName", '');

    prefs.setString('x-mainAdminPhoneNumber', '');
    prefs.setString("x-mainAdminAuth-token", "");
    //Navigator.popUntil(context, (route) => false);
    Navigator.pushNamedAndRemoveUntil(context, Toggle.route, (route) => false);
  }

  Future<List<ServiceTeam>> getAllServiceTeam(
      {required BuildContext context}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? mainAdmintoken = prefs.getString("x-mainAdminAuth-token");
      print('the mainAdmintoken is ${mainAdmintoken}');
      print('its coming1');
      if (mainAdmintoken == null) {
        prefs.setString('x-mainAdminAuth-token', '');
      }
      print('its coming2');
      var tokenRes = await http.get(Uri.parse('$uri/api/getAllServiceTeam'),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'x-mainAdminauth-token': mainAdmintoken!,
          });

      print('the tokenRes in getAllServiceTeam is ${tokenRes} ');
      final allSellerRes = jsonDecode(tokenRes.body);
      print('the allSellerRes is $allSellerRes');
      print('the allSellerRes[] is ${allSellerRes['allServiceTeam']}');

      List<ServiceTeam> allSellers = [];
      httpErrorHandle(
          response: tokenRes,
          context: context,
          onSuccess: () async {
            print('on success');
            var allSeller = allSellerRes['allServiceTeam'] as List;
            // print('allSeller IS ${allSeller}');
            var mySellerRes =
                allSeller.map((e) => ServiceTeam.fromMap(e)).toList();

            // print('myteamres is ${mySellerRes[0].teamAdminName}');
            // print('the lenght is ${mySellerRes.length}');
            for (int i = 0; i < mySellerRes.length; i++) {
              allSellers.add(mySellerRes[i]);
            }
          });
      // print('allSeller are ${allSellers[0]}');
      return allSellers;
    } catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
      List<ServiceTeam> allSellers = [];

      return allSellers;
    }
  }

  Future<List<Seller>> getAllSellers({required BuildContext context}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? mainAdmintoken = prefs.getString("x-mainAdminAuth-token");
      print('the mainAdmintoken is ${mainAdmintoken}');
      print('its coming1');
      if (mainAdmintoken == null) {
        prefs.setString('x-mainAdminAuth-token', '');
      }
      print('its coming2');
      var tokenRes = await http
          .get(Uri.parse('$uri/api/allSellers'), headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'x-mainAdminauth-token': mainAdmintoken!,
      });

      print('the tokenRes in getAllSellerTeam is ${tokenRes} ');
      final allSellerRes = jsonDecode(tokenRes.body);
      print('the allSellerRes is $allSellerRes');
      print('the allSellerRes[] is ${allSellerRes['sellers']}');

      List<Seller> allSellers = [];
      httpErrorHandle(
          response: tokenRes,
          context: context,
          onSuccess: () async {
            print('on success');
            var allSeller = allSellerRes['sellers'] as List;
            // print('allSeller IS ${allSeller}');
            var mySellerRes = allSeller.map((e) => Seller.fromMap(e)).toList();

            // print('myteamres is ${mySellerRes[0].teamAdminName}');
            // print('the lenght is ${mySellerRes.length}');
            for (int i = 0; i < mySellerRes.length; i++) {
              allSellers.add(mySellerRes[i]);
            }
          });
      // print('allSeller are ${allSellers[0]}');
      return allSellers;
    } catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
      List<Seller> allSellers = [];

      return allSellers;
    }
  }
}
