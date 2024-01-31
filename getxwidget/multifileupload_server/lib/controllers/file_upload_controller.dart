import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multifileupload_server/components/message_snackbar_popup.dart';
import 'package:flutter/material.dart';
import 'package:multifileupload_server/repositories/image_upload_repository.dart';

class FileUploadController extends GetxController {
  ImagePicker _picker = ImagePicker();
  List<XFile>? images = [];
  List<String> lstImagePath = [];
  var selectedFileCount = 0.obs;
  var isLoading = false.obs;

  //select photos
  void selectMultipleImage() async {
    images = await _picker.pickMultiImage();

    if (images != null) {
      for (XFile file in images!) {
        lstImagePath.add(file.path);
      }
    } else {
      Message.showSnackBar(
          'Fail', 'No image selected', Colors.white, Colors.red);
    }
    selectedFileCount.value=lstImagePath.length;
  }

  //upload images
  void uploadImage() async{
      isLoading.value=true;
      ImageUploadRepository.to.uploadImage(lstImagePath).then((resp){
        if(resp=='success'){
          Message.showSnackBar('Success', 'Image Uploaded', Colors.white, Colors.green);

          images=[];
          lstImagePath=[];
          isLoading.value=false;
        }
      }, onError: (err){
        isLoading.value=false;
        Message.showSnackBar('Fail', 'No image selected', Colors.white, Colors.red);
      });
  }

}
