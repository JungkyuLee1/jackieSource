import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widgets/common_wideget.dart';

class NetworkController extends GetxController {
  var connectionStatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();

    initConnectivity();
    listening();
  }

  //Connection call
  Future<void> initConnectivity() async {
    ConnectivityResult connectivityResult;

    try {
      connectivityResult = await _connectivity.checkConnectivity();

      _updateConnectionStatus(connectivityResult);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  //Connection listening;
  listening() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  //Connection 상태 setting
  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;
      default:
        Common.showSnackBar(
            'Network Error', 'Failed to get network connection!', Colors.red);
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
