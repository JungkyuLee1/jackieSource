import 'package:get/get.dart';
import 'package:todo/controller/home_controller.dart';
import 'package:todo/repository/task_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(TaskRepository());
  }
}
