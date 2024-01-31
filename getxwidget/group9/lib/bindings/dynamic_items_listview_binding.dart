import 'package:get/get.dart';
import 'package:group9/controllers/dynamic_items_listview_controller.dart';

class DynamicItemsToListViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DynamicItemsToListViewController());
  }

}