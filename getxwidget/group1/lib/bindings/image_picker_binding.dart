import 'package:feature_collection/controllers/image_picker_controller.dart';
import 'package:feature_collection/controllers/multi_image_controller.dart';
import 'package:feature_collection/repositories/image_upload_repository.dart';
import 'package:get/get.dart';

class ImagePickerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(ImagePickerController());
    Get.lazyPut(() => ImagePickerController());
    Get.put(ImageUploadRepository());
    // Get.lazyPut(() => ImageUploadRepository());
  }

  static multiImageBinding() {
    Get.put(MultiImageController());
  }
}
