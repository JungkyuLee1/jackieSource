import 'package:get/get.dart';

class WorkerController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }

  @override
  void onInit() {
    super.onInit();

    ever(count, (_) => run(count));
    everAll([count], (_) => print('EverAll(List) is $count'));
    once(count, (_) => print('Once is $count')); //1회 만
    interval(count, (_) => print('Interval is $count'),
        time: Duration(seconds: 2));
    debounce(count, (_) => print('Debounce is $count'),
        time: Duration(seconds: 3));
  }
}

void run(var cnt) {
  print('Ever is : $cnt');
}
