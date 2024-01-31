import 'package:get/get.dart';
import 'package:group2_features/models/popular_model.dart';

class PopularRepository extends GetConnect {
  static PopularRepository get to => Get.find();

  Future<List<Popular>> getPopular() async {
    try {
      final response =
          await get('https://www.episodate.com/api/most-popular?page=1');

      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        final jsonData = response.body['tv_shows'];

        return jsonData.map<Popular>((pop) => Popular.fromJson(pop)).toList();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
