import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePopup extends StatelessWidget {
  const MessagePopup(this.title, this.message,
      {this.okCallback, this.cancelCallback, Key? key})
      : super(key: key);

  final String? title;
  final String? message;
  final Function()? okCallback;
  final Function()? cancelCallback;

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
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text(
                  title!,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 10,),
                Text(
                  message!,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buttonOne(yesConfirm: 'Yes', noConfirm:'No')
                    // ElevatedButton(
                    //   onPressed: okCallback,
                    //   child: Text('Yes'),
                    //   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // ElevatedButton(
                    //   onPressed: cancelCallback,
                    //   child: Text('No'),
                    //   style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    // )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buttonOne({String yesConfirm='Ok', String noConfirm='No'}){
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: okCallback,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.orange
              ),
              child: Center(child: Text(yesConfirm)),
            ),
          ),
          SizedBox(width: 20,),
          GestureDetector(
            onTap: cancelCallback,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey
              ),
              child: Center(child: Text(noConfirm)),
            ),
          ),
        ],
      ),
    );
  }
}
