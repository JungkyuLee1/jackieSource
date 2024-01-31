import 'package:flutter/material.dart';
import 'package:responsive_whatsapp/src/pages/mobile_screen_layout.dart';
import 'package:responsive_whatsapp/src/pages/web_screen_layout.dart';
import 'package:responsive_whatsapp/src/responsive/resposnive_layout.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout());
  }
}
