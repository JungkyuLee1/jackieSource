import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/autocomplete_controller.dart';

class AutocompleteBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AutocompleteController());
  }

}