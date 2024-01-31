// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  List<User> userData;
  String result;
  String message;

  UserDataModel({
    required this.userData,
    required this.result,
    required this.message,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    userData: List<User>.from(json["userData"].map((x) => User.fromJson(x))),
    result: json["result"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "userData": List<dynamic>.from(userData.map((x) => x.toJson())),
    "result": result,
    "message": message,
  };
}

class User {
  int customerId;
  String customerFirstName;
  String customerLastName;
  String customerProfileImage;
  String customerEmail;
  String customerStatus;
  int userId;
  int roleId;
  String userMobile;
  DateTime createdOn;

  User({
    required this.customerId,
    required this.customerFirstName,
    required this.customerLastName,
    required this.customerProfileImage,
    required this.customerEmail,
    required this.customerStatus,
    required this.userId,
    required this.roleId,
    required this.userMobile,
    required this.createdOn,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    customerId: json["customerId"],
    customerFirstName: json["customerFirstName"],
    customerLastName: json["customerLastName"],
    customerProfileImage: json["customerProfileImage"],
    customerEmail: json["customerEmail"],
    customerStatus: json["customerStatus"],
    userId: json["userId"],
    roleId: json["roleId"],
    userMobile: json["userMobile"],
    createdOn: DateTime.parse(json["createdOn"]),
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "customerFirstName": customerFirstName,
    "customerLastName": customerLastName,
    "customerProfileImage": customerProfileImage,
    "customerEmail": customerEmail,
    "customerStatus": customerStatus,
    "userId": userId,
    "roleId": roleId,
    "userMobile": userMobile,
    "createdOn": createdOn.toIso8601String(),
  };
}
