import 'package:flutter/material.dart';
import 'package:mq_admin/model/mainAdmin_model.dart';

class MainAdminProvider extends ChangeNotifier {
  MainAdmin _mainAdmin = MainAdmin(
      mainAdminName: "",
      mainAdminPhoneNumber: "",
      mainAdminPassword1: "",
      mainAdminPassword2: "");

  MainAdmin get mainAdmin => _mainAdmin;
  void setMainAdmin(String seller) {
    _mainAdmin = MainAdmin.fromJson(seller);
  }

  void setsellerFromModel(MainAdmin seller) {
    _mainAdmin = seller;
    notifyListeners();
  }
}
