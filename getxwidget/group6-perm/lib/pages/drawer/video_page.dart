import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group6_withpermission/components/navigation_drawer_comp.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
        actions: [
          IconButton(onPressed: Get.back, icon: Icon(Icons.exit_to_app))
        ],
      ),
      drawer: NavigationDrawerComp(),
      body: Center(
        child: Text('Video Page'),
      ),
    );

  }
}
