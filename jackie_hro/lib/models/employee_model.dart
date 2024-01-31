import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Employee {
  final String? id;
  final String? name;
  final String? pictureUrl;
  final String? role;
  final Timestamp? startDate;
  final double? careerYear;
  final int? pay;
  final String? unit;
  final String? skillSet;
  final String? cellNo;
  final String? email;
  final Timestamp? birthday;
  final String? marriage;
  final String? familyHistory;
  final String? bankName;
  final String? bankAccount;
  final String? remark;
  final String? userAccount;
  final Timestamp? createDate;

  Employee(
      {this.id,
      this.name,
      this.pictureUrl,
      this.role,
      this.startDate,
      this.careerYear,
      this.pay,
      this.unit,
      this.skillSet,
      this.cellNo,
      this.email,
      this.birthday,
      this.marriage,
      this.familyHistory,
      this.bankName,
      this.bankAccount,
      this.remark,
      this.userAccount,
      this.createDate});

  Employee.fromDoc(DocumentSnapshot<Map<String, dynamic>> employeeDoc)
      : id = employeeDoc.id,
        name = employeeDoc.data()?['name'] ?? '',
        pictureUrl = employeeDoc.data()?['pictureUrl'] ?? '',
        role = employeeDoc.data()?['role'] ?? '',
        startDate = employeeDoc.data()?['startDate'] ??
            Timestamp.fromDate(DateTime.now()),
        careerYear = employeeDoc.data()?['careerYear'] ?? 0.0,
        pay = employeeDoc.data()?['pay'] ?? 0,
        unit = employeeDoc.data()?['unit'] ?? 'IDR',
        skillSet = employeeDoc.data()?['skillSet'] ?? '',
        cellNo = employeeDoc.data()?['cellNo'] ?? '',
        email = employeeDoc.data()?['email'] ?? '',
        birthday = employeeDoc.data()?['birthday'] ??
            Timestamp.fromDate(DateTime.now()),
        marriage = employeeDoc.data()?['marriage'] ?? '미혼',
        familyHistory = employeeDoc.data()?['familyHistory'] ?? '',
        bankName = employeeDoc.data()?['bankName'] ?? '',
        bankAccount = employeeDoc.data()?['bankAccount'] ?? '',
        remark = employeeDoc.data()?['remark'] ?? '',
        userAccount = employeeDoc.data()?['userAccount'] ?? '',
        createDate = employeeDoc.data()?['createDate'] ??
            Timestamp.fromDate(DateTime.now());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'pictureUrl': pictureUrl,
      'role': role,
      'startDate': startDate,
      'careerYear': careerYear,
      'pay': pay,
      'unit': unit,
      'skillSet': skillSet,
      'cellNo': cellNo,
      'email': email,
      'birthday': birthday,
      'marriage': marriage,
      'familyHistory': familyHistory,
      'bankName': bankName,
      'bankAccount': bankAccount,
      'remark': remark,
      'userAccount': userAccount,
      'createDate': createDate
    };
  }
}
