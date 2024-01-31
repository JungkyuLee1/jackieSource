import 'package:cloud_firestore/cloud_firestore.dart';

final employeeRef = FirebaseFirestore.instance.collection('employee');
final costRef = FirebaseFirestore.instance.collection('cost');
final urlTableRef = FirebaseFirestore.instance.collection('urlTable');
final scheduleRef = FirebaseFirestore.instance.collection('schedule');