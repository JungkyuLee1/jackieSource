import 'package:get/get.dart';
import 'package:group2_features/controllers/draggable_controller.dart';

class DraggableBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DraggableController());
  }

}