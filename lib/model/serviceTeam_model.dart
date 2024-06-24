import 'dart:convert';

import 'package:flutter/material.dart';

class ServiceTeam {
  String id;
  String teamAdminName;
  String teamAdminPassword;
  String teamAdminPhoneNumber;
  String teamRole;
  List<TeamMembers>? teamMembers;

  ServiceTeam(
      {required this.id,
      required this.teamAdminName,
      required this.teamAdminPassword,
      required this.teamAdminPhoneNumber,
      required this.teamMembers,
      required this.teamRole});

  factory ServiceTeam.fromMap(Map<String, dynamic> json) => ServiceTeam(
      id: json['_id'],
      teamAdminName: json['teamAdminName'],
      teamAdminPassword: json['teamAdminPassword'],
      teamAdminPhoneNumber: json['teamAdminPhoneNumber'],
      teamMembers: List<TeamMembers>.from(
          json["teamMembers"].map((x) => TeamMembers.fromMap(x))),
      teamRole: json['teamRole']);

  Map<String, dynamic> toMap() => {
        "teamAdminName": teamAdminName,
        "teamAdminPassword": teamAdminPassword,
        "teamAdminPhoneNumber": teamAdminPhoneNumber,
        "teamMembers": teamMembers,
        "teamRole": teamRole
      };
  factory ServiceTeam.fromJson(String str) =>
      ServiceTeam.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
}

class TeamMembers {
  String id;
  String memberName;
  String memberPassword;
  String memberPhoneNumber;

  TeamMembers(
      {required this.id,
      required this.memberName,
      required this.memberPassword,
      required this.memberPhoneNumber});

  factory TeamMembers.fromJson(String str) =>
      TeamMembers.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeamMembers.fromMap(Map<String, dynamic> json) => TeamMembers(
      id: json['_id'],
      memberName: json['memberName'],
      memberPassword: json['memberPassword'],
      memberPhoneNumber: json['memberPhoneNumber']);

  Map<String, dynamic> toMap() => {
        "_id": id,
        "memberName": memberName,
        "memberPassword": memberPassword,
        "memberPhoneNumber": memberPhoneNumber
      };
}
