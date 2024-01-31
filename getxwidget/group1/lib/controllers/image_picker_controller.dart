import 'package:feature_collection/repositories/image_upload_repository.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_compression_flutter/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/common_wideget.dart';

class ImagePickerController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  XFile? pickedFile;
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    pickedFile = await ImagePicker().pickImage(source: imageSource);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile!.path;

      //1st 1024 : kmb, 2nd 1024 : mb
      selectedImageSize.value =
          (File(selectedImagePath.value).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              ' Mb';

      // Crop
      final cropImageFile = await ImageCropper().cropImage(
          sourcePath: selectedImagePath.value,
          maxWidth: 512,
          maxHeight: 512,
          compressFormat: ImageCompressFormat.jpg);
      cropImagePath.value = cropImageFile!.path;
      cropImageSize.value =
          ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              ' Mb';

      //Compress
      final dir = await Directory.systemTemp;
      final targetPath = dir.absolute.path + '/temp.jpg';
      final compressedFile = await FlutterImageCompress.compressAndGetFile(
          cropImagePath.value, targetPath,
          quality: 90);

      compressImagePath.value = compressedFile!.path;
      compressImageSize.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              ' Mb';

      _uploadImage(compressedFile);
      // _uploadImage(File(pickedFile!.path));
    } else {
      Common.showSnackBar('Error', 'No image selected', Colors.red);
    }
  }

  //사진들 업로드
  void _uploadImage(File file) {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    try {
      ImageUploadRepository.to.uploadImage(file).then((resp) {
        Get.back();

        if (resp == 'success') {
          Common.showSnackBar('Success', 'File Uploaded', Colors.green);
        } else {
          Common.showSnackBar('Fail', 'File upload failed', Colors.red);
        }
      }, onError: (err) {
        Common.showSnackBar('Error', 'Error while uploading file', Colors.red);
      });
    } catch (e) {
      Common.showSnackBar('Error', e.toString(), Colors.red);
    }
  }
}
