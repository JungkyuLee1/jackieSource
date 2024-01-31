import 'package:get/get.dart';
import 'package:group2_features/controllers/draggable_game_controller.dart';

class DraggableGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DraggableGameController());
  }
}
