import 'package:get/get.dart';

class ReactiveController extends GetxController {
  RxInt count = 0.obs;
  int _count = 0;
  Rx<Student> student = Student.init().obs;

  // var count1=0.obs;
  // RxInt count2=0.obs;
  // var count3=RxInt(0);
  // var count4=Rx<int>(0);

  // //Rx{Type}
  // final name=RxString('');
  // final count1=RxInt(0);
  // final isLogged=RxBool(false);
  // final balance=RxDouble(0.0);
  // final items=RxList<String>([]);
  // final myMap=RxMap<String,int>({});
  //
  // //Dart Generic
  // final name1=Rx<String>('');
  // final count2=Rx<int>(0);
  // final isLogged1=Rx<bool>(false);
  // var balance1=Rx<double>(0.0);
  // final items1=Rx<List<String>>([]);
  // final myMap1=Rx<Map<String,int>>({});
  // final user=Rx<User>(User.init());
  // Rx<User> userInfo=User.init().obs;
  // var userInfo = User.init().obs;

  void increment() {
    _count++;
    count(_count);
  }

  void changeStudent({String? newName, int? newAge}) {
    student(Student(name: newName, age: newAge));
  }
}

class User {
  String? id;

  User(this.id);

  factory User.init() {
    return User('1');
  }
}

class Student {
  String? name;
  int? age;

  Student({this.name, this.age});

  factory Student.init() {
    return Student(name: 'charles', age: 20);
  }
}
