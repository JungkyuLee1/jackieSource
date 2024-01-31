import 'package:get/get.dart';
import 'package:group5/controllers/scratcher_controller.dart';

class ScratcherBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ScratcherController());
  }

}