	import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_layout/controllers/home_controller.dart';

class ResponsiveLayout extends GetView<HomeController> {
   ResponsiveLayout({required this.mobileBody, required this.desktopBody, Key? key}) : super(key: key);

  Widget mobileBody;
  Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth < 800){
        controller.deviceType.value='MOBILE';
        return mobileBody;
      }else{
        controller.deviceType('DESKTOP');
        return desktopBody;
      }
    });
  }
}
