import 'package:get/get.dart';

class DraggableController extends GetxController {
  var selected = List.generate(40, (index) => false).obs;
}
