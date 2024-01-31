import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MultiImageController extends GetxController {
  var imageFileList = <XFile>[].obs;
  List<XFile>? selectedImages;

  // RxList<Product> productList = <Product>[].obs;
// List<Product> productList = <Product>[].obs;
// var productList = <Product>[].obs;

  void getImages() async {
    selectedImages = await ImagePicker().pickMultiImage();

    if (selectedImages != null && selectedImages!.isNotEmpty) {
      imageFileList(selectedImages);
    }
  }
}
