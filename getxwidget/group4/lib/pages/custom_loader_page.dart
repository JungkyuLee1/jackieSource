import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group4/controllers/custom_loader_controller.dart';
import 'package:skeletons/skeletons.dart';

import '../components/empty_failure_nointernet_view.dart';

class CustomLoaderPage extends GetView<CustomLoaderController> {
  const CustomLoaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Loader')),
      body: Obx(
        () => controller.connectionStatus == 1
            ? controller.errorStatus == 'not-found'
                ? EmptyFailureNoInternetView(
                    image: 'assets/nodata.jpeg',
                    title: 'Error',
                    description: 'No data found',
                    buttonText: 'Retry',
                    onTap: () {
                      controller.getTvShow('1');
                    },
                  )
                : controller.errorStatus == 'PlatformException'
                    ? EmptyFailureNoInternetView(
                        image: 'assets/error.jpeg',
                        title: 'PlatformException',
                        description: 'Platform Exception..',
                        buttonText: 'Retry',
                        onTap: () {
                          controller.getTvShow('1');
                        },
                      )
                    : controller.errorStatus == 'Exception'
                        ? EmptyFailureNoInternetView(
                            image: 'assets/error.jpeg',
                            title: 'Exception',
                            description: 'Exception..',
                            buttonText: 'Retry',
                            onTap: () {
                              controller.getTvShow('1');
                            },
                          )
                        : ListView.separated(
                            padding: EdgeInsets.only(top: 8),
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 100,
                                    width: 80,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: controller
                                          .lstTvShow[index].imageThumbnailPath,
                                      placeholder: (context, url) => Center(
                                        child: SkeletonAvatar(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  controller.lstTvShow[index].name,
                                  style: TextStyle(fontSize: 16),
                                ),
                                subtitle: Text(
                                  controller.lstTvShow[index].country
                                      .toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.grey,
                              );
                            },
                            itemCount: controller.lstTvShow == []
                                ? 0
                                : controller.lstTvShow.length,
                            physics: BouncingScrollPhysics(),
                          )
            : EmptyFailureNoInternetView(
                image: 'assets/no-internet.png',
                title: 'Please wait..',
                description: 'Internet is poor now',
                buttonText: 'Retry',
                onTap: () {
                  controller.getTvShow('1');
                  // print('clicked');
                },
              ),
      ),
    );
  }
}
