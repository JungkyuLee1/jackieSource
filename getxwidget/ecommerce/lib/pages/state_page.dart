import 'package:ecommerce/common/components/empty_failure_nointernet.dart';
import 'package:ecommerce/common/values/app_color.dart';
import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/controllers/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatePage extends GetView<StateController> {
  StatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State'),
      ),
      body: controller.networkController.connectionStatus == 1
          ? Obx(
              () => ListView.builder(
                  controller: controller.scrollController,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.lstState.length,
                  itemBuilder: (context, index) {
                    final state = controller.lstState[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      child: Obx(
                        () => ListTile(
                          onTap: () {
                            controller.selectedIndex.value = index;
                            controller.stateModel = state;
                          },
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Get.isDarkMode
                                ? AppColor.yellowColor
                                : AppColor.deepPurpleAccentColor,
                            child: Text(
                              state.stateName.substring(0, 1),
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
                            state.stateName,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          trailing: state.stateId == controller.selectedStateId
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
                    onTap: () =>
                        controller.getState(countPerPage: 10, pageNo: 0),
                    isButtonVisible: true),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.saveSelectedState();
        },
        child: Icon(
          Icons.arrow_forward,
          color: Get.isDarkMode ? AppColor.blackColor : AppColor.whiteColor,
        ),
      ),
    );
  }
}
