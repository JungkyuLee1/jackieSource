import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LikeButtonController extends GetxController {
  var likeCount = 0;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    likeCount = storage.read('likeCount') ?? 0;
  }

  Future<bool> saveLikeCount(bool isLiked) async {
    storage.write('lisLiked', !isLiked);

    if (!isLiked) {
      likeCount++;
    } else {
      likeCount > 0 ? likeCount-- : 0;
    }
    storage.write('likeCount', likeCount);
    return !isLiked;
  }
}
