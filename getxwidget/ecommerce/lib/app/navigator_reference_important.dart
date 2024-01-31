import 'package:get/get.dart';

class NavigatorReferenceImportant{

  // reference(){
  //   Get.to(page)  --> Navigator.push();
  //   Get.toNamed(page) => Navigator.pushNamed();
  //   Get.back() => Navigator.pop(context);
  //   Get.off(page) => Navigator.pushReplacement();
  //   Get.offNamed(page) => Navigator.pushReplacementNamed();
  //   Get.offUntil(page, (route) => false) => Navigator.pushAndRemoveUntil()
  //   Get.offNamedUntil(page, (route) => false) => Navigator.pushNamedAndRemoveUntil();
  //   Get.offAndToNamed(page) =>Navigator.popAndPushNamed();
  //   Get.removeRoute(route) => Navigator.removeRoutes();
  //   Get.offAllNamed(newRouteName) => Navigator.pushNamedAndRemoveUntil();
  //   Get.close(times) => Navigator.popUntil();
  // }

  // Get.until
  // Remove screens until satisfying the condition.
  // It’s the same with Navigation.popUntil().
  // You can use it like Get.until((route) => Get.currentRoute == '/home').

  // Get.off
  // Remove the current screen and add a new screen.
  // It’s the same with Navigation.pushReplacement().
  // You can use it like Get.off(Second()).

  // Get.offNamed
  // By the Named route, remove the current screen and add a new screen.
  // It’s the same with Navigation.pushReplacementNamed().
  // You can use it like Get.offNamed('/second').

  // Get.offAndToNamed
  // By the Named route, add a new screen and then, remove the previous screen.
  // It’s the same with Navigation.popAndPushNamed().
  // You can use it like Get.offAndToNamed('/second').

  // Get.offUntil
  // Remove screens until satisfying the condition, and then, add a new screen.
  // It’s the same with Navigation.pushAndRemoveUntil().
  // You can use it like Get.offUntil(page, (route) => (route as GetPageRoute).routeName == '/home').

  // Get.offNamedUntil
  // By the Named route, remove screens until satisfying the condition, and then, add a new screen.
  // It’s the same with Navigation.pushNamedAndRemoveUntil().
  // You can use it like Get.offNamedUntil(page, ModalRoute.withName('/home')).

  // Get.removeRoute
  // Remove the screen that is satisfied the condition.
  // It’s the same with Navigation.removeRoute().
  // You can use it like Get.removeRoute(ModalRoute.withName('/home')).

  // Get.offAll
  // Remove all screens and then, add a new screen.
  // It’s the same with Navigation.pushNamedAndRemoveUntil().
  // You can use it like Get.offAll(Second()).

  // Get.offAllNamed
  // By the Named route, remove all screens and then, add a new screen.
  // It’s the same with Navigation.pushNamedAndRemoveUntil().
  // You can use it like Get.offAllNamed('/second').
}