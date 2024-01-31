import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PanoramaImageController extends GetxController{
  var selectImagePath=''.obs;

  void getImage(ImageSource imageSource) async{
    final pickedImage = await ImagePicker().pickImage(source: imageSource);

    if(pickedImage !=null){
      selectImagePath.value=pickedImage.path;
    }else{
      print('No image selected');
    }
  }
}