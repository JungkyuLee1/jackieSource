import 'package:get/get.dart';
import 'package:group3_features/bindings/sppech_to_text_binding.dart';
import 'package:group3_features/pages/speech_to_text_page.dart';

import '../app/splash.dart';

class AppPages {
  static const INITIAL='/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => Splash()),
    GetPage(
      name: '/speechToText',
      page: () => SpeechTextPage(),
      binding: SpeechTextBinding(),
    ),
  ];
}
