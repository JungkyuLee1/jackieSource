import 'package:basic_widget/RouteTest/route_test_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteTestMainPage extends StatelessWidget {
  const RouteTestMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Main'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // var data= await Get.to(RouteTestHomePage(),
            //     // fullscreenDialog: true,
            //     // transition: Transition.zoom,
            //     duration: Duration(milliseconds: 1000),
            //     // curve: Curves.bounceInOut,
            //   arguments: 'args from main'
            // );

            // var data = await Get.toNamed('/routeTestHome',
            //   arguments: 'args with toNamed',
            // );
            //
            //
            //URL Link
            Get.toNamed(
                '/routeTestHome?channel=jackie chnl&content=Flutter getx');
          },
          child: Text('Go to Home'),
        ),
      ),
    );
  }
}
