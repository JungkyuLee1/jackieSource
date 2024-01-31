import 'package:get/get.dart';
import 'package:group9/app/splash.dart';
import 'package:group9/bindings/app_update_checker_binding.dart';
import 'package:group9/bindings/auto_redirect/home_binding.dart';
import 'package:group9/bindings/auto_redirect/login_binding.dart';
import 'package:group9/bindings/auto_redirect/splash_binding.dart';
import 'package:group9/bindings/circle_rotate_animate_binding.dart';
import 'package:group9/bindings/confetti_effect_binding.dart';
import 'package:group9/bindings/dynamic_items_listview_binding.dart';
import 'package:group9/bindings/like_button_binding.dart';
import 'package:group9/bindings/multi_image_binding.dart';
import 'package:group9/bindings/multi_line_select_binding.dart';
import 'package:group9/bindings/sms_code_binding.dart';
import 'package:group9/bindings/video_trim_binding.dart';
import 'package:group9/components/video_trim_view.dart';
import 'package:group9/pages/app_update_checker_page.dart';
import 'package:group9/pages/auto_redirect/home_page.dart';
import 'package:group9/pages/auto_redirect/login_page.dart';
import 'package:group9/pages/circle_rotate_animate_page.dart';
import 'package:group9/pages/confetti_effect_page.dart';
import 'package:group9/pages/draggable_expandable_fab_page.dart';
import 'package:group9/pages/dynamic_items_listview_page.dart';
import 'package:group9/pages/like_button_page.dart';
import 'package:group9/pages/multi_image_page.dart';
import 'package:group9/pages/multi_line_select_page.dart';
import 'package:group9/pages/sms_code_page.dart';
import 'package:group9/pages/video_pick_page.dart';

class Routes {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(
      name: '/splash',
      page: () => Splash(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: '/confetti',
      page: () => ConfettiEffectPage(),
      binding: ConfettiEffectBinding(),
    ),
    GetPage(
      name: '/appUpdateChecker',
      page: () => AppUpdateCheckerPage(),
      binding: AppUpdateCheckerBinding(),
    ),
    GetPage(
        name: '/draggableExpandable', page: () => DraggableExpandableFabPage()),
    GetPage(
      name: '/videoTrimmer',
      page: () => VideoPickPage(),
      binding: VideoTrimBinding(),
    ),
    GetPage(name: '/videoTrimView', page: () => VideoTrimView()),
    GetPage(
      name: '/multiImage',
      page: () => MultiImagePage(),
      binding: MultiImageBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
    GetPage(
      name: '/smsCode',
      page: () => SmsCodePage(),
      binding: SmsCodeBinding(),
    ),
    GetPage(
        name: '/dynamicItems',
        page: () => DynamicItemsToListViewPage(),
        binding: DynamicItemsToListViewBinding()),
    GetPage(
        name: '/likeButton',
        page: () => LikeButtonPage(),
        binding: LikeButtonBinding()),
    GetPage(
        name: '/rotatingAnimation',
        page: () => CircleRotateAnimatePage(),
        binding: CircleRotateAnimateBinding()),
    GetPage(
      name: '/selectMultiLines',
      page: () => MultiLineSelectPage(),
      binding: MultiLineSelectBinding(),
    ),
  ];
}
