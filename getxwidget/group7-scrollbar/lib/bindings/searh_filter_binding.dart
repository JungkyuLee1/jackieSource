import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/search_filter_controller.dart';

class SearchFilterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SearchFilterController());
  }

}