import 'package:get/get.dart';

class Member{
  final String name;
  var isSelected=false.obs;

  Member({required this.name, required this.isSelected});
}