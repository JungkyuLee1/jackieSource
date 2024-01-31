import 'package:get/get.dart';

class MultiSelectDropDownController extends GetxController{
  List<String> options=['GetX', 'Provider', 'BloC', 'Mobx'];
  Rx<List<String>> selectedOptions =Rx<List<String>>([]);
  var selectedOption=''.obs;
}