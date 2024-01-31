import 'package:get/get.dart';

import '../controllers/reorderable_controller.dart';

class ReOrderAbleBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReOrderAbleController());
  }

}