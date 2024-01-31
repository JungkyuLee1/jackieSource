import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:group4/models/tv_show_model.dart';

import '../Api/api.dart';

class CustomRepository extends GetConnect {
  static CustomRepository get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Api.baseUrl;
    httpClient.defaultContentType = 'application/json';
  }

  Future<TvShowModel> getTvShow(String page) async {
    try {
      final response = await get('?page=' + page);
      return Future.error(response.statusText.toString());

      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        var jsonData = response.bodyString;
        var result = TvShowModelFromJson(jsonData!);
        return result;
      }
    } on PlatformException catch (e) {
      throw e;
      // return Future.error(e.toString());
    } catch (e) {
      throw e;
      // return Future.error(e.toString());
    }
  }
}
