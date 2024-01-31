import 'package:get/get.dart';
import 'package:group6_withpermission/models/state_model.dart';
import 'package:group6_withpermission/models/zone_model.dart';

import '../api/api.dart';

class DropDownRepository extends GetConnect {
  static DropDownRepository get to => Get.find();

  @override
  onInit() {
    super.onInit();
    httpClient.baseUrl = Api.baseUrl;
  }

  //Zone data
  Future<ZoneModel> getZone() async {
    try {
      final response = await get('app/api/getZone');

      if (response.hasError) {
        printError();
        return Future.error(response.statusText!);
      } else {
        var result = zoneModelFromJson(response.bodyString!);
        print('zoneResult : ${result.zoneData[0].zoneName}');
        return result;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  //State Data
  Future<StateModel> getState(String zoneId) async {
    try {
      final response = await get('app/api/getStates/' + zoneId);

      if (response.hasError) {
        return Future.error(response.statusText!);
      } else {
        var result = stateModelFromJson(response.bodyString!);
        return result;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
