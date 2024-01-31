import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../common/utils/get_storage_key.dart';
import '../common/values/app_string.dart';
import '../repositories/user_repository.dart';

class NavigationDrawerController extends GetxController {
  GetStorage _getStorage = GetStorage();
  String? userFullName,
      userInitials,
      userMobile,
      userFirstName,
      userLastName,
  userEmail;
  var userProfileImage=''.obs;

  @override
  void onInit() {
    super.onInit();

    userFullName =
        _getStorage.read(GetStorageKey.userFullName) ?? AppString.guestUser;
    userFirstName =
        _getStorage.read(GetStorageKey.userFirstName) ?? AppString.g;
    userFirstName = userFirstName.toString().substring(0, 1);
    userLastName = _getStorage.read(GetStorageKey.userLastName) ?? AppString.u;
    userLastName = userLastName.toString().substring(0, 1);
    userProfileImage.value = _getStorage.read(GetStorageKey.userProfileImage) ?? 'https://image.kmib.co.kr/online_image/2022/0913/2022091221050432016_1662984304_0924263320.jpg';
    userInitials = userFirstName! + userLastName!;
    userMobile =
        _getStorage.read(GetStorageKey.userMobile) ?? AppString.guestMobile;
    userEmail = _getStorage.read(GetStorageKey.customerEmail) ?? AppString.customerEmail;


    getUserImage();
  }

  getUserImage() async {
    userProfileImage.value =
        await UserRepository.to.getProfileImage(userName: 'federer.jpg');
    print('userProfileImage : ${userProfileImage}');
  }
}
