import 'package:get/get.dart';
import 'package:group9/models/member_model.dart';

class MultiLineSelectController extends GetxController{
  List<Member> members=[];

  @override
  void onInit() {
    super.onInit();
    createInitialData();
  }

  void createInitialData(){
    List.generate(30, (index) => members.add(Member(name: 'Name '+index.toString(), isSelected: false.obs)));
  }

}