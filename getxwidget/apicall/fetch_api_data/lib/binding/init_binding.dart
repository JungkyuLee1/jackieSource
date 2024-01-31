import 'package:fetch_api_data/repository/product_repository.dart';
import 'package:get/instance_manager.dart';

class InitBindings implements Bindings{

  @override
  void dependencies() {
    Get.put(ProductRepository());
  }
}