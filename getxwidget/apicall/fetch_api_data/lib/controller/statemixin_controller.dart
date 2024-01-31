import 'package:fetch_api_data/repository/user_repository.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class StateMixinController extends GetxController
    with StateMixin<List<User>> {

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  void getUser() {
    UserRepository.to.getUser().then(
        (resp) => change(resp, status: RxStatus.success()), onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
