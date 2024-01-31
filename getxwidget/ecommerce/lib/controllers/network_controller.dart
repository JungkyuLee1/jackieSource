import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

class NetworkController extends GetxController {
  var connectionStatus = 0.obs;
  late StreamSubscription<InternetConnectionStatus> _listener;

  //Web 버전 처리용(없으면 에러 발생) 1
  Future<bool> hasNetwork() async {
    try {
      final result = await http.get(Uri.parse('www.google.com'));

      if(result.statusCode==200){
        return true;
      }
      else{
        return false;
      }
    }
    on SocketException catch (_) {
      return false;
    }
  }

  @override
  void onInit() async{
    super.onInit();
    //Web 버전 처리용(없으면 에러 발생) 2
    if(kIsWeb) {
      await hasNetwork();
    }

      _listener = InternetConnectionChecker()
          .onStatusChange
          .listen((InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            connectionStatus.value = 1;
            break;
          case InternetConnectionStatus.disconnected:
            connectionStatus.value = 0;
            break;
        }
      });

  }
}
