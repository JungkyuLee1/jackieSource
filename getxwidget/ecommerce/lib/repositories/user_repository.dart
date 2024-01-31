import 'package:ecommerce/models/state_data_model.dart';
import 'package:ecommerce/models/user_data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../api/api.dart';

class UserRepository extends GetConnect {
  static UserRepository get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Api.base_url;
  }

  //User 정보 조회
  Future<UserDataModel> getUserDetails(
      {required String userId, required String roleId}) async {
    try {
      final response = await get(
          '/multistore/public/api/getUserDetails?userId=$userId&roleId=$roleId');

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        var jsonData = userDataModelFromJson(response.bodyString!);
        return jsonData;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  //User Profile Image 가져오기
  Future<String> getProfileImage({required String userName}) async {
    try {
      final profile = Api.base_url +
          '/multistore/public/api/getProfileImage?fileName=${userName}';

      if (profile.isEmpty || profile.isBlank!) {
        return Future.error('no image');
        // return 'https://cdn-7.motorsport.com/images/amp/0RrmAdV0/s1000/alex-albon-williams-fw45-1.jpg';
      } else {
        return profile;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
