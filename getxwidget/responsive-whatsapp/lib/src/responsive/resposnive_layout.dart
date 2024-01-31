import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
   ResponsiveLayout({required this.mobileScreenLayout,
    required this.webScreenLayout,
    Key? key}) : super(key: key);

  Widget mobileScreenLayout;
  Widget webScreenLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth > 900){
        return webScreenLayout;
      }else{
        return mobileScreenLayout;
      }
    });
  }
}
