import 'package:ecommerce/common/utils/get_storage_key.dart';
import 'package:ecommerce/common/values/app_color.dart';
import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/controllers/navigation_drawer_controller.dart';
import 'package:ecommerce/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class NavigationDrawerComp extends GetView<NavigationDrawerController> {
  NavigationDrawerComp({Key? key}) : super(key: key);

  //Header
  buildDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? AppColor.yellowColor
            : AppColor.deepPurpleAccentColor,
        borderRadius: BorderRadius.circular(8),
      ),
      accountName: Text(
        controller.userFullName!,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
              fontWeight: FontWeight.bold,
            ),
      ),
      accountEmail: Text(
        controller.userEmail!,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 12),
      ),
      currentAccountPicture: CircleAvatar(
        radius: 10,
        backgroundImage: NetworkImage(controller.userProfileImage.value),
      ),
      currentAccountPictureSize: Size.square(72),
    );
  }

  //Item
  buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required Function() onTap,
  }) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: Icon(
        icon,
        color: textIconColor,
      ),
      title: Text(
        text,
        style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  //Home으로 되돌아가기
  navigate(int index) {
    if (index == 0) {
      Get.offNamed('/home');
    }else if(index==1){
      Get.offNamed('/myAccount');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Obx(
        () => ListView(
          children: [
            buildDrawerHeader(context),
            Divider(
              color: Theme.of(context).dividerColor,
            ),
            buildDrawerItem(
              icon: Icons.home,
              text: AppString.home,
              onTap: () => navigate(0),
              tileColor: Get.currentRoute == '/home'
                  ? (Get.isDarkMode
                      ? AppColor.yellowColor
                      : AppColor.deepPurpleAccentColor)
                  : null,
              textIconColor: Get.currentRoute == '/home'
                  ? (Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor)
                  : (Get.isDarkMode
                      ? AppColor.whiteColor
                      : AppColor.blackColor),
            ),
            buildDrawerItem(
              icon: Icons.account_box,
              text: AppString.myAccount,
              onTap: () => navigate(1),
              tileColor: Get.currentRoute == '/myAccount'
                  ? (Get.isDarkMode
                  ? AppColor.yellowColor
                  : AppColor.deepPurpleAccentColor)
                  : null,
              textIconColor: Get.currentRoute == '/myAccount'
                  ? (Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor)
                  : (Get.isDarkMode
                  ? AppColor.whiteColor
                  : AppColor.blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
