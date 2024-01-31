import 'package:get/get.dart';
import 'package:group3_features/controllers/speech_to_text_controller.dart';

class SpeechTextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpeechTextController());
  }
}
