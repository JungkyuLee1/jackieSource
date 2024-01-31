import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group6_withpermission/components/message_popup.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/permissionHandler');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Permission Handler &\n'
                          'Latitude & Longitude'),
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.dialog(MessagePopup(
                        '참조(Ripples Code)',
                        'https://www.youtube.com/watch?v=gD1X-GZMoBY&list=PLCaS22Sjc8YR32XmudgmVqs49t-eKKr9t&index=67',
                        cancelCallback: Get.back,
                      ));
                    },
                    child: Text('Prevent Screen Shot & \n Video Recording')),

                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/dropdown');
                    },
                    child: Text('DropDown with Server')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/password');
                    },
                    child: Text('Password Strength')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/drawer');
                    },
                    child: Text('Drawer Navigation')),
                // ElevatedButton(
                //     onPressed: () {
                //       Get.toNamed('/draggableDrag');
                //     },
                //     child: Text('Draggable Drag')),
                // ElevatedButton(
                //     onPressed: () {
                //       Get.toNamed('/dragGame');
                //     },
                //     child: Text('Draggable Drag(Game)')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
