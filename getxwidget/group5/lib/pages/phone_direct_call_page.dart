import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:group5/controllers/phone_call_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneDirectCallPage extends GetView<PhoneCallController> {
  const PhoneDirectCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Direct Phone Call'),
      ),
      body: Center(
        child: Container(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 200),
            child: ElevatedButton(
              onPressed: () async{
                controller.makePhoneCall('081323903572');
                // FlutterPhoneDirectCaller.callNumber('1234567');

              },
              child: Text('Call'),
            ),
          ),
        ),
      ),
    );
  }
}
