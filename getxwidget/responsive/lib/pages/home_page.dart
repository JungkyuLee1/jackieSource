import 'package:flutter/material.dart';
import 'package:responsive_layout/pages/desktop_body_page.dart';
import 'package:responsive_layout/pages/mobile_body_page.dart';
import 'package:responsive_layout/pages/responsive/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBodyPage(),
        desktopBody: DesktopBodyPage(),
      ),
    );
  }
}
