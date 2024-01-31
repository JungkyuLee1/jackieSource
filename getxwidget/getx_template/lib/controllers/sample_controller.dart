import 'package:get/get.dart';

class SampleController extends GetxController{
  // RxInt count = 0.obs;
  // RxDouble _double=0.0.obs;
  // RxString value="".obs;
  // Rx<NUM> nums=NUM.FIRST.obs;
  // Rx<User> user=User("Jackie",22).obs;
  // RxList<String> list =['a'].obs;
  // RxNum currentValue = RxNum(10);

  // The first is using Rx{Type}
  // initial value is recommended, but not mandatory
  final name = RxString('');
  final isLogged = RxBool(false);
  final count = RxInt(0);
  final balance = RxDouble(0.0);
  final items = RxList<String>([]);
  final myMap = RxMap<String, int>({});

// //The second is to use Rx and use Darts Generics, Rx<Type>
//   final name = Rx<String>('');
//   final isLogged = Rx<Bool>(false);
//   final count = Rx<Int>(0);
//   final balance = Rx<Double>(0.0);
//   final number = Rx<Num>(0)
//   final items = Rx<List<String>>([]);
//   final myMap = Rx<Map<String, int>>({});
// // Custom classes — it can be any class,
//   final user = Rx<User>();

//   final name = ''.obs;
//   final isLogged = false.obs;
//   final count = 0.obs;
//   final balance = 0.0.obs;
//   final number = 0.obs;
//   final items = <String>[].obs;
//   final myMap = <String, int>{}.obs;
// // Custom classes — it can be any class,
//   final user = User().obs;
}