import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group6_withpermission/controllers/permission_handler_controller.dart';

class LocationPage extends GetView<PermissionHandlerController> {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lat & Long'),
      ),
      body: Center(
        child: Obx(
          ()=> Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My address is..', style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(controller.address.value),
              SizedBox(height: 30,),
              Text('Latitude : ${controller.latitude}', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Longitude : ${controller.longitude}', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
