import 'package:get/get.dart';
import 'package:group9/controllers/confetti_effect_controller.dart';

class ConfettiEffectBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ConfettiEffectController());
  }

}