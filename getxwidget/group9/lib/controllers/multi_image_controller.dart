import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MultiImageController extends GetxController{
  Rx<List<XFile>> selectedFileList=Rx<List<XFile>>([]);

  List<XFile>? selectedImages=[];

  void getImages() async{
    selectedImages = await ImagePicker().pickMultiImage();

    if(selectedImages!.isNotEmpty){
      selectedFileList.value=selectedImages!;
    }
  }
}