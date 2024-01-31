import 'package:get/get.dart';
import 'package:group2_features/bindings/carousel_slider_binding.dart';
import 'package:group2_features/bindings/draggable_binding.dart';
import 'package:group2_features/bindings/draggable_game_binding.dart';
import 'package:group2_features/bindings/form_validate_binding.dart';
import 'package:group2_features/bindings/scroll_cont_binding.dart';
import 'package:group2_features/bindings/video_player_binding.dart';
import 'package:group2_features/pages/carousel_slider_page.dart';
import 'package:group2_features/pages/draggable_drag_page.dart';
import 'package:group2_features/pages/draggable_game_page.dart';
import 'package:group2_features/pages/draggable_page.dart';
import 'package:group2_features/pages/form_validate_page.dart';
import 'package:group2_features/pages/scroll_cont_page.dart';
import 'package:group2_features/pages/video_player_page.dart';

import '../app/splash_page.dart';

class AppPages {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => Splash()),
    GetPage(
      name: '/scrollCont',
      page: () => ScrollContPage(),
      binding: ScrollContBinding(),
    ),
    GetPage(
      name: '/carouselSlider',
      page: () => CarouselSliderPage(),
      binding: CarouselSliderBinding(),
    ),
    GetPage(
      name: '/videoPlayer',
      page: () => VideoPlayerPage(),
      binding: VideoPlayerBinding(),
    ),
    GetPage(
      name: '/draggable',
      page: () => DraggablePage(),
      binding: DraggableBinding(),
    ),
    GetPage(
        name: '/validateForm',
        page: () => FormValidatePage(),
        binding: FormValidateBinding()),
    GetPage(name: '/draggableDrag', page: () => DraggableDragPage()),
    GetPage(
        name: '/dragGame',
        page: () => DraggableGamePage(),
        binding: DraggableGameBinding()),
  ];
}
