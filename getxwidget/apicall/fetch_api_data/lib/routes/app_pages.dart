import 'package:fetch_api_data/binding/statemixin_binding.dart';
import 'package:fetch_api_data/controller/statemixin_controller.dart';
import 'package:fetch_api_data/page/get_connect_statemixin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controller/email_storage_cotroller.dart';
import '../controller/product_controller.dart';
import '../page/email_storage_page.dart';
import '../page/product_list_page.dart';
import '../splash.dart';

class AppPages {
  static const INITIAL = '/splash';

  static final routes =
      [
        GetPage(name: '/splash', page: () => SplashPage()),
        GetPage(
            name: '/apiCall',
            page: () => ProductListPage(),
            binding: BindingsBuilder(() {
              Get.lazyPut<ProductController>(() => ProductController());
            })),
        GetPage(
            name: '/emailStorage',
            page: () => EmailStoragePage(),
            binding: BindingsBuilder(() {
              Get.lazyPut<EmailStorageController>(
                      () => EmailStorageController());
            })),
        GetPage(
            name: '/getConnectStateMixin',
            page: () => GetConnectStateMixinPage(),
            binding: StateMixingBinding())
      ];
}
