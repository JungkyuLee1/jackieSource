import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//차이점(GetXController vs GetXService) : controller 가 메모리 상주(==permanent : true)
class GetXServiceController extends GetxService{

  Future<void> incrementCount() async{
    // SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? count =(prefs.getInt('cnt') ?? 0) + 1;
    print('Service count is $count');

    await prefs.setInt('cnt', count);
  }
}