import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogPopup extends StatelessWidget {
  const DialogPopup(this.message,
      {required this.buttonText ,required this.okCallback, Key? key})
      : super(key: key);

  final String message;
  final String buttonText;
  final Function() okCallback;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      // type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Get.size.width*0.7,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text(
                  message,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: okCallback,
                      child: Text(buttonText),
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
