import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:group4/common/widgets.dart';
import 'package:group4/models/tv_show_model.dart';
import 'package:group4/repositories/custom_repository.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../components/empty_failure_nointernet_view.dart';

class CustomLoaderController extends GetxController {
  var lstTvShow = <TvShow>[].obs;
  var connectionStatus = 0.obs;
  var errorStatus=''.obs;
  late StreamSubscription<InternetConnectionStatus> _listener;

  @override
  void onInit() {
    super.onInit();
    _connectionListener();
  }

  @override
  void onReady() {
    super.onReady();
    getTvShow('aa');
  }

  //Internet connection listen
  void _connectionListener() {
    _listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          connectionStatus(1);
          break;
        case InternetConnectionStatus.disconnected:
          connectionStatus(0);
          break;
      }
    });
  }

  //Data fetch
  void getTvShow(String page) {
    try {
      CustomRepository.to.getTvShow(page).then((val) {
        lstTvShow.clear();
        lstTvShow.addAll(val.tvShows);
      }, onError: (err) {
        errorStatus('not-found');
        
        // print('err: ${err.toString()}');
        // Get.to( EmptyFailureNoInternetView(
        //   image: 'assets/nodata.jpeg',
        //   title: 'Error',
        //   description: 'No data found',
        //   buttonText: 'Retry',
        //   onTap: () {
        //     getTvShow('1');
        //     // print('clicked');
        //   },
        // ));

        // Widgets.showSnackBar(
        //     'Error', 'No data found', Colors.white, Colors.red);
      });
    } on PlatformException catch (e) {
      errorStatus('PlatformException');

      // print('PlatformException: ${e.toString()}');
      // EmptyFailureNoInternetView(
      //   image: 'assets/error.jpeg',
      //   title: 'PlatformException',
      //   description: e.toString(),
      //   buttonText: 'Retry',
      //   onTap: () {
      //     getTvShow('1');
      //     // print('clicked');
      //   },
      // );

      // Widgets.showSnackBar('PlatformException Exception', e.toString(),
      //     Colors.white, Colors.red);
    } catch (e) {
      errorStatus('Exception');

      // print('exception : ${e.toString()}');
      // EmptyFailureNoInternetView(
      //   image: 'assets/error.jpeg',
      //   title: 'Exception',
      //   description: e.toString(),
      //   buttonText: 'Retry',
      //   onTap: () {
      //     getTvShow('1');
      //     // print('clicked');
      //   },
      // );

      // Widgets.showSnackBar('Exception', e.toString(), Colors.white, Colors.red);
    }
  }

  @override
  void onClose() {
    super.onClose();
    _listener.cancel();
  }
}
