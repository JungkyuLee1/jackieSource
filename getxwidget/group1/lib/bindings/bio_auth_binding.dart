import 'package:feature_collection/controllers/bio_auth_controller.dart';
import 'package:get/get.dart';

class BioAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BioAuthController());
  }
}
