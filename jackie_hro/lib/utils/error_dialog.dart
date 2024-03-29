import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jackie_hr/models/customer_error.dart';

void errorDialog(BuildContext context, CustomError e) {
  if (Platform.isIOS) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(e.code),
              content: Text(e.plugin + '\n' + e.message),
              actions: [
                CupertinoDialogAction(
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ));
  } else {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(e.code),
              content: Text(e.plugin + '\n' + e.message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context), child: Text('OK'))
              ],
            ));
  }
}
