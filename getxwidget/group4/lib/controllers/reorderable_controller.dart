import 'package:get/get.dart';

class ReOrderAbleController extends GetxController {
  List<String> myFavs =
      ['Java', 'Flutter', 'MySQL', 'React JS', 'Node JS', 'Laravel'].obs;

  void reorder(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final items = myFavs.removeAt(oldIndex);

    myFavs.insert(newIndex, items);
  }
}
