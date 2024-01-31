import 'package:get/get.dart';

import '../api/api.dart';
import '../models/area_data_model.dart';

class AreaRepository extends GetConnect {
  static AreaRepository get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Api.base_url;
  }

  //Area 조회
  Future<AreaResult> getArea(
      {required int cityId,
      required int countPerPage,
      required int pageNo}) async {
    try {
      final response = await get(
          '/multistore/public/api/getArea?cityId=$cityId&countPerPage=$countPerPage&pageNo=$pageNo');

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        var jsonData = areaResultFromJson(response.bodyString!);
        return jsonData;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
