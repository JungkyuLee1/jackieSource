import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Api/api.dart';

class ImageUploadRepository extends GetConnect {
  static ImageUploadRepository get to => Get.find();
  var rtnMsg;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Api.baseUrl;
  }

  //Images 업로드
  Future<String> uploadImage(File file) async {
    try {
      Map<String, String> mapData = {
        'id': '100',
        'fileName': 'test1',
        'fileUrl': 'aaabbb'
      };

      final form = FormData(
          {'fileInfo':mapData, 'files': MultipartFile(file, filename: 'aa.jpg')});

      final response = await post("/todoApp/api/imageUpload", form);

      if (response.hasError) {
        return Future.error(response.statusText!);
      } else {
        final result = response.body;

        if (result != null) {
          rtnMsg = 'success';
        } else {
          rtnMsg = 'fail';
        }
      }
      return rtnMsg;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
