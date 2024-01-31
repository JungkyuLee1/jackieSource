import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group5/controllers/tabBar_controller.dart';
import 'package:group5/pages/arc_paint_page.dart';
import 'package:group5/pages/circle_paint_page.dart';
import 'package:group5/pages/image_paint_page.dart';
import 'package:group5/pages/line_paint_page.dart';
import 'package:group5/pages/rectangel_paint_page.dart';
import 'package:group5/pages/rounded_rectangel_page.dart';
import 'package:group5/pages/triangle_paint_page.dart';

class TabBarCustomPainterPage extends GetView<TabBarController> {
  const TabBarCustomPainterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Custom Paint'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            controller: controller.tabController,
            tabs: controller.tabs,
            isScrollable: true,
            indicatorWeight: 3,
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            LinePaintPage(),
            RectanglePaintPage(),
            RoundedRectanglePage(),
            CirclePaintPage(),
            ArcPaintPage(),
            TrianglePaintPage(),
            ImagePaintPage()
          ],
        ),

    );
  }
}
