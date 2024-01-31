import 'package:ecommerce/models/state_data_model.dart';
import 'package:ecommerce/models/user_data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../api/api.dart';

class StateRepository extends GetConnect {
  static StateRepository get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Api.base_url;
  }

  //State 정보조회
  Future<StateDataModel> getState(
      {required int countPerPage, required int pageNo}) async {

    try {
      final response = await get('/multistore/public/api/getState?countPerPage=$countPerPage&pageNo=$pageNo');
      if(response.status.hasError){
        return Future.error(response.statusText!);
      }else{
        var jsonData=stateDataModelFromJson(response.bodyString!);
        return jsonData;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
