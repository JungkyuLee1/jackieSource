import 'package:ecommerce/common/utils/get_storage_key.dart';
import 'package:ecommerce/controllers/city_controller.dart';
import 'package:ecommerce/controllers/state_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController{
  GetStorage _getStorage = GetStorage();

  String? selectedState, selectedCity, selectedArea;
  StateController _stateController = Get.find<StateController>();
  CityController _cityController = Get.find<CityController>();

  @override
  void onInit() {
    super.onInit();

    selectedState = _getStorage.read(GetStorageKey.stateName);
    selectedCity = _getStorage.read(GetStorageKey.cityName);
    selectedArea = _getStorage.read(GetStorageKey.areaName);
  }

  moveToState(){
        Get.offNamedUntil  ('/state', (route) => false);
  }
}