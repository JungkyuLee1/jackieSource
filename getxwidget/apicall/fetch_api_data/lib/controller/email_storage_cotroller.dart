import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class EmailStorageController extends GetxController{
  TextEditingController emailController = TextEditingController();
  var storage=GetStorage();
  var readValue = ''.obs;

  void write(){
    storage.write('email', emailController.text);
  }

  void read(){
    readValue(storage.read('email'));
  }
}