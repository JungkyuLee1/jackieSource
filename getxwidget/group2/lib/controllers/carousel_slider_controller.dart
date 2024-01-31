import 'package:get/get.dart';
import 'package:group2_features/models/popular_model.dart';
import 'package:group2_features/repositories/popular_repository.dart';

class CarouselSliderController extends GetxController {
  var populars = List<Popular>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var isDataError = false.obs;

  @override
  void onInit() {
    super.onInit();

    getPopular();
  }

  void getPopular() {
    try {
      isDataProcessing(true);
      PopularRepository.to.getPopular().then((resp) {
        populars.clear();
        isDataProcessing(false);
        isDataError(false);

        populars.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        isDataError(true);

        // ViewError();
      });
    } catch (e) {
      isDataProcessing(false);
      isDataError(true);
    }
  }
}
