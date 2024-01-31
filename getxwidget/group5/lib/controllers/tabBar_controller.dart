import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TabName {
  Line,
  Rectangle,
  Rounded_Rectangle,
  Circle,
  Arc,
  Triangle,
  Image
}

class TabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  List<Tab> tabs = List.generate(
      TabName.values.length,
      (index) => Tab(
            text:
                '${TabName.values[index].name.contains('_') ? TabName.values[index].name.split('_')[0] + TabName.values[index].name.split('_')[1] : TabName.values[index].name}',
            icon: iconType(index),
          ));

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: TabName.values.length, vsync: this);
  }

  static Icon iconType(index) {
    final type = TabName.values[index];
    Icon icon;

    switch (type) {
      case TabName.Line:
        icon = Icon(Icons.linear_scale);
        break;
      case TabName.Rectangle:
        icon = Icon(Icons.rectangle_outlined);
        break;
      case TabName.Rounded_Rectangle:
        icon = Icon(Icons.rounded_corner);
        break;
      case TabName.Circle:
        icon = Icon(Icons.circle);
        break;
      case TabName.Arc:
        icon = Icon(Icons.architecture);
        break;
      case TabName.Triangle:
        icon = Icon(Icons.train);
        break;
      case TabName.Image:
        icon = Icon(Icons.image);
        break;
      default:
        icon = Icon(Icons.menu);
        break;
    }
    return icon;
  }
}
