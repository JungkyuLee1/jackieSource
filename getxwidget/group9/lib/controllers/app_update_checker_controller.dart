import 'package:get/get.dart';
import 'package:new_version/new_version.dart';

class AppUpdateCheckerController extends GetxController {
  // late final NewVersion newVersion;

  @override
  void onInit() {
    super.onInit();
    versionCheck();
  }

  void versionCheck() async {
    final newVersion =
        await NewVersion(iOSId: "com.csi.sellon", androidId: "com.csi.sellon");
    newVersion.showAlertIfNecessary(context: Get.context!);


    ////183 from the new_version.dart to (elm) => elm.text.contains('key: \'ds:5\''),
    final status = await newVersion.getVersionStatus();

    print('status : ${status}');
    print('storeVersion : ${status!.storeVersion}');
    print('localVersion : ${status!.localVersion}');

    
    // if (status != null) {
    //   newVersion.showUpdateDialog(
    //       context: Get.context!,
    //       versionStatus: status,
    //       dialogTitle: 'Update Available',
    //       dialogText: 'Update the app to continue',
    //       allowDismissal: false,
    //       updateButtonText: 'Update',
    //       dismissAction: () {},
    //       dismissButtonText: 'Cancel');
    // }
  }
}
