import 'package:get/get.dart';
import 'package:group2_features/controllers/carousel_slider_controller.dart';
import 'package:group2_features/repositories/popular_repository.dart';

class CarouselSliderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PopularRepository());
    Get.lazyPut(() => CarouselSliderController());
  }
}
