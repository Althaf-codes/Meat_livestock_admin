import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mq_admin/model/allProduct_model.dart';
import 'package:mq_admin/model/product_model.dart';
import 'package:mq_admin/providers/allProduct_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/snackbar.dart';
import 'package:http/http.dart' as http;

import '../constants/Global_Variables.dart';
import '../constants/errror_handling.dart';

class ProductService {
  Future<List<Product>> getallUnverifiedProducts(
      {required BuildContext context}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? adminToken = prefs.getString('x-mainAdminAuth-token');
      print('its coming1');
      print('the token is $adminToken');
      http.Response res = await http.get(
        Uri.parse('$uri/api/getUnverifiedProducts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-mainAdminauth-token': adminToken!
        },
      );
      print('its coming2');
      final allProductRes = jsonDecode(res.body);
      // print('the allProductRes is $allProductRes');
      print('its coming3');
      if (allProductRes['isTrue'] == false) {
        print('its coming5');
        List<Product> allProducts = [];
        return allProducts;
      }
      List<Product> myallprod = [];
      print('its coming4');
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   AdminMainHomePage.route,
            //   ((route) => false),
            // );
            print('on success');
            var allProducts = allProductRes['allProducts'] as List;
            //   print('all products in onsuccess is ${allProducts}');
            //   showSnackBar(context, 'Data retrieved sucessfully');

            var myprod = allProducts.map((e) => Product.fromMap(e)).toList();
            // print('**************************************');
            // print('myprod is ${myprod}');
            for (int i = 0; i < myprod.length; i++) {
              myallprod.add(myprod[i]);
            }
            Provider.of<AllProductsProvider>(context, listen: false)
                .setAllProducts(res.body);
          });
      return myallprod;
    } on Exception catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
      List<Product> allProducts = [];
      return allProducts;
    }
  }

  // Future<void> getallUnverifiedProducts({required BuildContext context}) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();

  //     String? adminToken = prefs.getString('x-mainAdminAuth-token');
  //     print('its coming1');
  //     print('the token is $adminToken');
  //     http.Response res = await http.get(
  //       Uri.parse('$uri/api/getUnverifiedProducts'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'x-mainAdminauth-token': adminToken!
  //       },
  //     );
  //     print('its coming2');
  //     final allProductRes = jsonDecode(res.body);
  //     // print('the allProductRes is $allProductRes');
  //     print('its coming3');
  //     // if (allProductRes['isTrue'] == false) {
  //     //   print('its coming5');
  //     //   List<Product> allProducts = [];
  //     //   return allProducts;
  //     // }
  //     List<Product> myallprod = [];
  //     print('its coming4');
  //     httpErrorHandle(
  //         response: res,
  //         context: context,
  //         onSuccess: () async {
  //           // Navigator.pushNamedAndRemoveUntil(
  //           //   context,
  //           //   AdminMainHomePage.route,
  //           //   ((route) => false),
  //           // );
  //           print('on success');
  //           var allProducts = allProductRes['allProducts'] as List;
  //           //   print('all products in onsuccess is ${allProducts}');
  //           //   showSnackBar(context, 'Data retrieved sucessfully');

  //           // var myprod = allProducts.map((e) => Product.fromMap(e)).toList();
  //           // // print('**************************************');
  //           // // print('myprod is ${myprod}');
  //           // for (int i = 0; i < myprod.length - 1; i++) {
  //           //   myallprod.add(myprod[i]);
  //           // }
  //           return Provider.of<AllProductsProvider>(context, listen: false)
  //               .setAllProducts(res.body);
  //         });
  //     // return myallprod;
  //   } on Exception catch (e) {
  //     print('the err is ${e.toString()}');
  //     showSnackBar(context, e.toString());
  //     // List<Product> allProducts = [];
  //     // return allProducts;
  //   }
  // }

  Future<List<Product>> getallVerifiedProducts(
      {required BuildContext context}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? adminToken = prefs.getString('x-mainAdminAuth-token');
      print('its coming1');
      print('the token is $adminToken');
      http.Response res = await http.get(
        Uri.parse('$uri/api/getVerifiedProducts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-mainAdminauth-token': adminToken!
        },
      );
      print('its coming2');
      final allProductRes = jsonDecode(res.body);
      // print('the allProductRes is $allProductRes');
      print('its coming3');
      if (allProductRes['isTrue'] == false) {
        print('its coming5');
        List<Product> allProducts = [];
        return allProducts;
      }
      List<Product> myallprod = [];
      print('its coming4');
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   AdminMainHomePage.route,
            //   ((route) => false),
            // );
            print('on success');
            var allProducts = allProductRes['allProducts'] as List;
            //   print('all products in onsuccess is ${allProducts}');
            //   showSnackBar(context, 'Data retrieved sucessfully');

            var myprod = allProducts.map((e) => Product.fromMap(e)).toList();
            // print('**************************************');
            // print('myprod is ${myprod}');
            for (int i = 0; i < myprod.length - 1; i++) {
              myallprod.add(myprod[i]);
            }
            // return Provider.of<AllProductsProvider>(context, listen: false)
            //     .setAllProducts(res.body);
          });
      return myallprod;
    } on Exception catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
      List<Product> allProducts = [];
      return allProducts;
    }
  }

  Future<void> verifyProduct(
      {required BuildContext context, required String productID}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? adminToken = prefs.getString('x-mainAdminAuth-token');
      print('its coming1');
      print('the token is $adminToken');
      http.Response res = await http.patch(
        Uri.parse(
            '$uri/api/productVerification/product-id?productId=$productID'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-mainAdminauth-token': adminToken!
        },
      );

      final verifyRes = jsonDecode(res.body);
      print('the verifyRes is ${verifyRes}');
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, verifyRes['msg']);
          });
    } on Exception catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());

      //   return allProducts;
    }
  }

  Future<void> addNewMember({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? adminToken = prefs.getString('x-mainAdminAuth-token');

      http.Response res = await http.post(
          Uri.parse('$uri/api/addNewServiceTeam'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-mainAdminauth-token': adminToken!
          },
          body: {
            'adminName': '',
            'password': '',
            'teamRole': '',
            'phoneNumber': ''
          });
    } on Exception catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
    }
  }
}
