import 'package:get/get.dart';
import 'package:responsive_whatsapp/src/pages/mobile_chat_screen.dart';
import 'package:responsive_whatsapp/src/splash.dart';

class Routes{

  static const INITIAL='/splash';

  static final routes=[
    GetPage(name: '/splash', page: ()=>Splash()),
    GetPage(name: '/mobileChatScreen', page: ()=>MobileChatScreen()),
  ];
}