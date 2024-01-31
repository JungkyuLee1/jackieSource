import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar Example'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.black),
          onPressed: () {
            Get.snackbar('제목', '내용입니다',
                snackPosition: SnackPosition.BOTTOM,
                // titleText: Text('겹친 제목'),
                //   messageText: Text('겹쳐진 내용입니다'),
                colorText: Colors.white,
                backgroundColor: Colors.yellow,
                borderRadius: 30,
                margin: EdgeInsets.all(10),
                // maxWidth: 100,
                // animationDuration: Duration(microseconds: 1000),
                backgroundGradient:
                    LinearGradient(colors: [Colors.purple, Colors.black]),
                borderColor: Colors.yellow,
                borderWidth: 10,
                boxShadows: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(30, 50),
                      spreadRadius: 20,
                      blurRadius: 8),
                ],
                // isDismissible: true,
                // dismissDirection: DismissDirection.horizontal,
                forwardAnimationCurve: Curves.bounceInOut,
                duration: Duration(milliseconds: 3000),
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                shouldIconPulse: false,
                //icon이 애니메이션 미적용
                mainButton: TextButton(
                  onPressed: () {
                    print('Retry is clicked');
                  },
                  child: Text(
                    'Retry',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: (value) {
                  print('Snackbar clicked : $value');
                },
                overlayBlur: 5,
                //button blur
                overlayColor: Colors.grey.withOpacity(0.2),
                padding: EdgeInsets.all(50),
                showProgressIndicator: true,
                progressIndicatorBackgroundColor: Colors.deepOrange,
                progressIndicatorValueColor:
                    AlwaysStoppedAnimation<Color>(Colors.white),
                reverseAnimationCurve: Curves.bounceInOut,
                snackbarStatus: (val) {
                  print('snackbarStatue : $val');
                },
                // userInputForm: Form(
                //   child: Row(
                //     children: [Expanded(child: TextField())],
                //   ),
                // )
            );
          },
          child: Text(
            'Snackbar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
