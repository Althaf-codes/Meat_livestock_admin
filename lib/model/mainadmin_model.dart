// To parse this JSON data, do
//
//     final mainAdmin = mainAdminFromMap(jsonString);

import 'dart:convert';

class MainAdmin {
  MainAdmin({
    required this.mainAdminName,
    required this.mainAdminPhoneNumber,
    required this.mainAdminPassword1,
    required this.mainAdminPassword2,
  });

  final String mainAdminName;
  final String mainAdminPhoneNumber;
  final String mainAdminPassword1;
  final String mainAdminPassword2;

  MainAdmin copyWith({
    String? mainAdminName,
    String? mainAdminPhoneNumber,
    String? mainAdminPassword1,
    String? mainAdminPassword2,
  }) =>
      MainAdmin(
        mainAdminName: mainAdminName ?? this.mainAdminName,
        mainAdminPhoneNumber: mainAdminPhoneNumber ?? this.mainAdminPhoneNumber,
        mainAdminPassword1: mainAdminPassword1 ?? this.mainAdminPassword1,
        mainAdminPassword2: mainAdminPassword2 ?? this.mainAdminPassword2,
      );

  factory MainAdmin.fromJson(String str) => MainAdmin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MainAdmin.fromMap(Map<String, dynamic> json) => MainAdmin(
        mainAdminName: json["mainAdminName"],
        mainAdminPhoneNumber: json["mainAdminPhoneNumber"],
        mainAdminPassword1: json["mainAdminPassword1"],
        mainAdminPassword2: json["mainAdminPassword2"],
      );

  Map<String, dynamic> toMap() => {
        "mainAdminName": mainAdminName,
        "mainAdminPhoneNumber": mainAdminPhoneNumber,
        "mainAdminPassword1": mainAdminPassword1,
        "mainAdminPassword2": mainAdminPassword2,
      };
}
