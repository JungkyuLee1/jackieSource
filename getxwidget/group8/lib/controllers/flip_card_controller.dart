import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';

class FlipCardHandleController extends GetxController{
  late FlipCardController flipCardController;

  @override
  void onInit() {
    super.onInit();
    flipCardController=FlipCardController();
  }
}