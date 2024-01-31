import 'package:ecommerce/models/city_data_model.dart';
import 'package:get/get.dart';

import '../api/api.dart';

class CityRepository extends GetConnect {
  static CityRepository get to => Get.find<CityRepository>();

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Api.base_url;
  }

  //City정보 조회
  Future<CityResult> getCity(
      {required int stateId,
      required int countPerPage,
      required int pageNo}) async {
    try {
      final response = await get(
          '/multistore/public/api/getCity?stateId=$stateId&countPerPage=$countPerPage&pageNo=$pageNo');

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        var jsonData = cityResultFromJson(response.bodyString!);
        return jsonData;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
