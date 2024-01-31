import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:group9/models/employ_model.dart';

class DynamicItemsToListViewController extends GetxController{
  Rx<List<EmployeeModel>> employees = Rx<List<EmployeeModel>>([]);
  var itemCount =0.obs;
  late EmployeeModel employeeModel;
  late TextEditingController nameTextEditingController;
  late TextEditingController addressTextEditingController;
  String? name, address;



  //Employee 추가
  addEmployee({required String name, required String address}){
    employeeModel = EmployeeModel(name: name, address: address);

    employees.value.add(employeeModel);
    itemCount.value=employees.value.length;
    nameTextEditingController.clear();
    addressTextEditingController.clear();
  }

  //empoyee 삭제
  removeEmployee(int index){
    employees.value.removeAt(index);

    itemCount.value=employees.value.length;
  }

  @override
  void onInit() {
    super.onInit();
    nameTextEditingController=TextEditingController();
    addressTextEditingController=TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameTextEditingController.dispose();
    addressTextEditingController.dispose();
  }
}