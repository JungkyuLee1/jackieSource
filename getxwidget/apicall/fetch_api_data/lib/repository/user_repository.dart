import 'package:get/get.dart';

import '../model/user.dart';

class UserRepository extends GetConnect{
  static UserRepository get to=>Get.find();

  Future<List<User>> getUser() async{
    final response = await get('https://randomuser.me/api/?results=10');

    if(response.status.hasError){
      return Future.error(response.statusText!);
    }else{
      var jsonData = response.body['results'];

      var result=jsonData.map<User>((usr)=> User.fromJson(usr)).toList();
      return result;
    }
  }
}