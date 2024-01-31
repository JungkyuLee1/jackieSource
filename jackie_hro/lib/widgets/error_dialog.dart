import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Error 처리
void errorDialog(BuildContext context, Exception e) {
  String errorTitle, errorPlugin, errorMessage;

  if (e is FirebaseException) {
    errorTitle = e.code;
    errorPlugin = e.plugin;
    errorMessage = e.message!;
  } else {
    errorTitle = 'Exception';
    errorPlugin = 'flutter_error/server_error';
    errorMessage = e.toString();
  }

  if (Platform.isIOS) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                title: Text(errorTitle),
                content: Text(errorPlugin + '\n' + errorMessage),
                actions: [
                  CupertinoDialogAction(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'))
                ],
              ));
    });
  } else {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(errorTitle),
                content: Text(errorPlugin + '\n' + errorMessage),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'))
                ],
              ));
    });
  }
}
