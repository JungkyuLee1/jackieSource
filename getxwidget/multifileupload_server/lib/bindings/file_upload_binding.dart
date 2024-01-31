import 'package:get/get.dart';
import 'package:multifileupload_server/controllers/file_upload_controller.dart';

import '../repositories/image_upload_repository.dart';

class FileUploadBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FileUploadController());
    Get.put(ImageUploadRepository());
  }

}