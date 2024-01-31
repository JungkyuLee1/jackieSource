import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsyncController extends GetxController {

  Future<void> incrementCount() async {
    // SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? counter = (prefs.getInt('count') ?? 0) + 1;
    print('counter is $counter');
    await prefs.setInt('count', counter);
  }
}
