import 'package:ecommerce/common/components/empty_failure_nointernet.dart';
import 'package:ecommerce/common/values/app_color.dart';
import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/controllers/city_controller.dart';
import 'package:ecommerce/controllers/state_controller.dart';
import 'package:ecommerce/pages/state_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CityPage extends GetView<CityController> {
  const CityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City'),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            child: Icon(
              Icons.arrow_back,
              color: AppColor.whiteColor,
            ),
          ),
        ),
      ),
      body: controller.networkController.connectionStatus == 1
          ? Obx(
              () => controller.lstCity.length == 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 10),
                      child: SingleChildScrollView(
                          child: EmptyFailureNoInternet(
                        image: 'images/empty.png',
                        title: AppString.area,
                        description: AppString.areaNotFound,
                        buttonText: AppString.retry,
                        isButtonVisible: true,
                        onTap: () => controller.getCity(),
                      )),
                    )
                  : ListView.builder(
                      controller: controller.scrollController,
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.lstCity.length,
                      itemBuilder: (context, index) {
                        final city = controller.lstCity[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 16),
                          child: Obx(
                            () => ListTile(
                              onTap: () {
                                controller.selectedIndex.value = index;
                                controller.cityModel = city;
                              },
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Get.isDarkMode
                                    ? AppColor.yellowColor
                                    : AppColor.deepPurpleAccentColor,
                                child: Text(
                                  city.cityName.substring(0, 1),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Get.isDarkMode
                                              ? AppColor.blackColor
                                              : AppColor.whiteColor),
                                ),
                              ),
                              tileColor: controller.selectedIndex.value == index
                                  ? (Get.isDarkMode
                                      ? AppColor.yellowColor.withOpacity(.2)
                                      : AppColor.deepPurpleAccentColor
                                          .withOpacity(.2))
                                  : Theme.of(context).canvasColor,
                              title: Text(
                                city.cityName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                              ),
                              dense: true,
                              trailing: city.cityId == controller.selectedCityId
                                  ? Icon(
                                      Icons.check_circle,
                                      color: AppColor.greenColor,
                                    )
                                  : null,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        );
                      }),
            )
          : SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: EmptyFailureNoInternet(
                image: 'images/no-internet.png',
                title: AppString.networkError,
                description: AppString.connectWithInternet,
                buttonText: AppString.retry,
                isButtonVisible: true,
                onTap: () => controller.getCity(),
              ),
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.saveSelectedCity();
        },
        child: Icon(Icons.arrow_forward,
            color: Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor),
      ),
    );
  }
}
