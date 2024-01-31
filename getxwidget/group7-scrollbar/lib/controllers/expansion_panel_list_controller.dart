import 'package:get/get.dart';
import 'package:group7_scrollbar/data/model/employee.dart';

class ExpansionPanelListController extends GetxController {
  late List<Employee> employees;

  @override
  void onInit() {
    super.onInit();
    employees = generateEmployees(20);
  }

  List<Employee> generateEmployees(int num) {
    return List.generate(
        num,
        (index) =>
            Employee('Employee-$index', 'Employee-$index Details', false.obs));
  }
}
