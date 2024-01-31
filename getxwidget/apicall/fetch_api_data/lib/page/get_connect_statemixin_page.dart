import 'package:fetch_api_data/controller/statemixin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/user_info.dart';

class GetConnectStateMixinPage extends GetView<StateMixinController> {
  const GetConnectStateMixinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User List'),
        ),
        body: controller.obx(
            (data) => ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  final user = data[index];

                  return UserInfo(user);
                }),
            onError: (error) => Center(
                  child: Text(error.toString()),
                )));
  }
}
