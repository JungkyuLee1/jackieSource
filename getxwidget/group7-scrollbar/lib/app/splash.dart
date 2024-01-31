import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/scrollbarWithScroll');
                      },
                      child: Text('Scrollbar on Scrollable')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/scrollNotification');
                      },
                      child: Text('Scroll Notification')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/autoComplete');
                      },
                      child: Text('AutoComplete')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/emojiPicker');
                      },
                      child: Text('Emoji Picker')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/datePicker');
                      },
                      child: Text('Date&Time Picker')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/numPicker');
                      },
                      child: Text('Number Picker')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/expansionPanel');
                      },
                      child: Text('Expansion Panel List')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/copyPaste');
                      },
                      child: Text('Copy & Paste')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/hideFAB');
                      },
                      child: Text('Hide Floating Action Button')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/searchFilter');
                      },
                      child: Text('Search/Filter ListView')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
