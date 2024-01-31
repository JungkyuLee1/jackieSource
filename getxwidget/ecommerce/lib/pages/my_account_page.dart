import 'package:ecommerce/common/components/navigation_drawer_comp.dart';
import 'package:ecommerce/common/values/app_color.dart';
import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/controllers/my_account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccountPage extends GetView<MyAccountController> {
  const MyAccountPage({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        AppString.myAccount,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor),
      ),
      actions: [
        Obx(
          ()=> IconButton(
              onPressed: () {
                controller.changeTheme();
              },
              icon: controller.isDarkMode.value
                  ? Icon(CupertinoIcons.brightness)
                  : Icon(
                      CupertinoIcons.moon_stars,
                      color: AppColor.whiteColor,
                    )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(
        child: Text('My Account'),
      ),
      drawer: NavigationDrawerComp(),
    );
  }
}
