import 'package:ecommerce/common/components/empty_failure_nointernet.dart';
import 'package:ecommerce/common/values/app_color.dart';
import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/controllers/area_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AreaPage extends GetView<AreaController> {
  const AreaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area'),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            child: Icon(Icons.arrow_back, color: AppColor.whiteColor),
          ),
        ),
      ),
      body: controller.networkController.connectionStatus == 1
          ? Obx(
              () => controller.lstArea.length == 0
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
                        onTap: () => controller.getArea(),
                      )),
                    )
                  : ListView.builder(
                      controller: controller.scrollController,
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.lstArea.length,
                      itemBuilder: (context, index) {
                        final area = controller.lstArea[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                          child: Obx(
                            () => ListTile(
                              onTap: () {
                                controller.isSelectedIndex.value = index;
                                controller.areaModel = area;
                              },
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Get.isDarkMode
                                    ? AppColor.yellowColor
                                    : AppColor.deepPurpleAccentColor,
                                child: Text(
                                  area.areaName.substring(0, 1),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Get.isDarkMode
                                              ? AppColor.blackColor
                                              : AppColor.whiteColor),
                                ),
                              ),
                              tileColor:
                                  controller.isSelectedIndex.value == index
                                      ? (Get.isDarkMode
                                          ? AppColor.yellowColor.withOpacity(.2)
                                          : AppColor.deepPurpleAccentColor
                                              .withOpacity(.2))
                                      : Theme.of(context).canvasColor,
                              title: Text(
                                area.areaName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                              ),
                              dense: true,
                              trailing: area.areaPinCode ==
                                      controller.selectedAreaPinCode
                                  ? Icon(Icons.check_circle,
                                      color: AppColor.greenColor)
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
                    onTap: () {
                      controller.getArea();
                    },
                    isButtonVisible: true),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.saveSelectedArea();
        },
        child: Icon(
          Icons.arrow_forward,
          color: Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        ),
      ),
    );
  }
}
