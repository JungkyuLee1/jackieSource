import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/expansion_panel_list_controller.dart';

class ExpansionPanelListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ExpansionPanelListController());
  }

}