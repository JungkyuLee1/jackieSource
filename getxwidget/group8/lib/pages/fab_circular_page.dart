import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group8/controllers/fab_circular_controller.dart';

class FabCircularPage extends GetView<FabCircularController> {
  const FabCircularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAB Circular'),
      ),
      body: Center(
        child: RawMaterialButton(
          onPressed: () {},
          shape: CircleBorder(side: BorderSide(width: 1, color: Colors.blue)),
          padding: EdgeInsets.all(10),
          child: Icon(
            Icons.email,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FabCircularMenuPlus(
        key: controller.fabKey,
        alignment: Alignment.bottomRight,
        ringColor: Colors.blue.withOpacity(.4),
        ringDiameter: 450,
        fabSize: 60,
        fabElevation: 8,
        fabIconBorder: CircleBorder(),
        fabColor: Colors.blueAccent,
        fabOpenIcon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        fabCloseIcon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        fabMargin: EdgeInsets.all(16),
        animationDuration: Duration(milliseconds: 800),
        animationCurve: Curves.easeInOutCirc,
        onDisplayChange: (isOpen) {
          print('isOpen : $isOpen');
        },
        children: [
          RawMaterialButton(
            onPressed: () {
              controller.openCloseFabMenu();
            },
            shape: CircleBorder(side: BorderSide(width: 1, color: Colors.blue)),
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.home,
              color: Colors.blue,
            ),
          ),
          RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(side: BorderSide(width: 1, color: Colors.blue)),
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.email,
              color: Colors.blue,
            ),
          ),
          RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(side: BorderSide(width: 1, color: Colors.blue)),
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
          ),
          RawMaterialButton(
            onPressed: () {
            },
            shape: CircleBorder(
              side: BorderSide(width: 1, color: Colors.blue),
            ),
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
