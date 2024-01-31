import 'package:ecommerce/common/components/navigation_drawer_comp.dart';
import 'package:ecommerce/common/values/app_color.dart';
import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  _buildSearch(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // controller.moveToState();
        Get.to(SearchPage(),
            fullscreenDialog: true,
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 600));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).canvasColor),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: AppColor.greyColor,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              AppString.searchProductBrandMore,
              style: Theme.of(context).textTheme.titleMedium!,
            )
          ],
        ),
      ),
    );
  }

  _buildSelectedStateCityArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Get.isDarkMode
          ? AppColor.yellowColor.withOpacity(.2)
          : AppColor.deepPurpleAccentColor.withOpacity(.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.location_city,
            color: Get.isDarkMode
                ? AppColor.yellowColor
                : AppColor.deepPurpleAccentColor,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${controller.selectedState} / ${controller.selectedCity} / ${controller.selectedArea}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode
                          ? AppColor.yellowColor
                          : AppColor.deepPurpleAccentColor),
                ),
              ],
            ),
          ),
          Icon(
            Icons.edit,
            color: Get.isDarkMode
                ? AppColor.yellowColor
                : AppColor.deepPurpleAccentColor,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerComp(),
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: ListView(
          children: [
            _buildSearch(context),
            SizedBox(
              height: 2,
            ),
            _buildSelectedStateCityArea(context),
            SizedBox(
              height: 8,
            )
          ],
        ));
  }
}
