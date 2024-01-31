import 'package:flutter/material.dart';
// import 'dart:js' as js; //Web(Chrome)에서만 작동

class JavaScriptPage extends StatelessWidget {
  const JavaScriptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Javascript Code'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // js.context.callMethod(
            //     'customAlertMessage', ['This is called from Javascript']);
          },
          child: Text('Call Custom JavaScript'),
        ),
      ),
    );
  }
}
