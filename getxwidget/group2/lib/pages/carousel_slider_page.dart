import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group2_features/controllers/carousel_slider_controller.dart';
import 'package:group2_features/pages/error_page.dart';

class CarouselSliderPage extends GetView<CarouselSliderController> {
  const CarouselSliderPage({Key? key}) : super(key: key);

  List<Widget> generateSlider() {
    List<Widget> imageSliders = controller.populars.map((item) {
      return Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: item.imageThumbnailPath,
            fit: BoxFit.cover,
            width: Get.width,
            placeholder: (context, url) => Container(
              color: Colors.grey,
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
      );
    }).toList();
    return imageSliders;
  }

  makeImageList() {
    return List.generate(
        controller.populars.isEmpty ? 0 : controller.populars.length, (index) {
      return Container(
        margin: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: controller.populars[index].imageThumbnailPath,
            fit: BoxFit.cover,
            width: Get.width,
            placeholder: (context, url) => Container(
              color: Colors.grey,
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel Slider'),
      ),
      body: Obx(() {
        if (controller.isDataProcessing.value) {
          return Center(
            child: Container(
              margin: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (controller.isDataError.value) {
            return ErrorPage(onPressed: ()=>controller.getPopular());
          } else {
            return Column(
              children: [
                CarouselSlider(
                    items: makeImageList(),
                    // items: generateSlider(),
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height
                    )),
              ],
            );
          }
        }
      }),
    );
  }
}
