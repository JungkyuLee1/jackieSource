import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class VideoPickController extends GetxController {


  void pickVideo() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.video, allowCompression: false);

    if (result != null) {
      File file = File(result.files.single.path!);
      Get.toNamed('/videoTrimView', arguments: file);
    }
  }
}
