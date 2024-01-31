import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group6_withpermission/components/navigation_drawer_comp.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(onPressed: Get.back, icon: Icon(Icons.exit_to_app))
        ],
      ),
      drawer: NavigationDrawerComp(),
      body: Center(
        child: Text('Chat Page'),
      ),
    );

  }
}
