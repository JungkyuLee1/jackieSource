import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class ConfettiEffectController extends GetxController {
  late ConfettiController confettiController;
  var isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    confettiController = ConfettiController();
  }

  void startConfettiAnimation() {
    if (confettiController.state == ConfettiControllerState.playing) {
      isPlaying.value = false;
      confettiController.stop();
    } else {
      isPlaying.value = true;
      confettiController.play();
    }
  }
}
