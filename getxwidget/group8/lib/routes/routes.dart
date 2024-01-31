import 'package:get/get.dart';
import 'package:group8/app/splash.dart';
import 'package:group8/bindings/fab_circular_binding.dart';
import 'package:group8/bindings/loading_btn_indicator_binding.dart';
import 'package:group8/bindings/multi_select_binding.dart';
import 'package:group8/bindings/panorama_image_binding.dart';
import 'package:group8/bindings/rating_dialog_binding.dart';
import 'package:group8/bindings/reviews_slider_binding.dart';
import 'package:group8/bindings/shake_phone_binding.dart';
import 'package:group8/bindings/shrink_sidemenu_binding.dart';
import 'package:group8/pages/fab_circular_page.dart';
import 'package:group8/pages/flip_card_page.dart';
import 'package:group8/pages/loading_btn_indicator_page.dart';
import 'package:group8/pages/multi_select_dialog_page.dart';
import 'package:group8/pages/multi_select_dropdown_page.dart';
import 'package:group8/pages/panorama_image_page.dart';
import 'package:group8/pages/rating_dialog_page.dart';
import 'package:group8/pages/reviews_slider_page.dart';
import 'package:group8/pages/shake_phone_page.dart';
import 'package:group8/pages/shrink_sidemenu_page.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';

class Routes {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => Splash()),
    GetPage(
      name: '/loadingBtnIndicator',
      page: () => LoadingBtnIndicatorPage(),
      binding: LoadingBtnIndicatorBinding(),
    ),
    GetPage(
      name: '/flipCard',
      page: () => FlipCardPage(),
      binding: LoadingBtnIndicatorBinding(),
    ),
    GetPage(
        name: '/shakePhone',
        page: () => ShakePhonePage(),
        binding: ShakePhoneBinding()),
    GetPage(
      name: '/multiSelectDialog',
      page: () => MultiSelectDialogPage(),
      binding: MultiSelectBinding(),
    ),
    GetPage(
      name: '/multiSelectDropDown',
      page: () => MultiSelectDropDownPage(),
      binding: MultiSelectBinding(),
    ),
    GetPage(
      name: '/fabCircular',
      page: () => FabCircularPage(),
      binding: FabCircularBinding(),
    ),
    GetPage(
        name: '/shrinkSideMenu',
        page: () => ShrinkSideMenuPage(),
        binding: ShrinkSideMenuBinding()),
    GetPage(
      name: '/panoramaImage',
      page: () => PanoramaImagePage(),
      binding: PanoramaImageBinding(),
    ),
    GetPage(
      name: '/reviewsSlider',
      page: () => ReviewsSliderPage(),
      binding: ReviewsSliderBinding(),
    ),
    GetPage(
        name: '/ratingDialog',
        page: () => RatingDialogPage(),
        binding: RatingDialogBinding()),
  ];
}
