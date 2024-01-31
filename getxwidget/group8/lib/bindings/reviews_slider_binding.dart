import 'package:get/get.dart';
import 'package:group8/controllers/reviews_slider_controller.dart';

class ReviewsSliderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewsSliderController());
  }

}