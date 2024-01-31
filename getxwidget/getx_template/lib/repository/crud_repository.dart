import 'package:get/get.dart';

import '../api/api.dart';
import '../model/task_model.dart';
import '../model/todo_model.dart';

class TaskRepository extends GetConnect {
  static TaskRepository get to => Get.find();
  var rtnMessage;

  //TaskRepository binding 필수(Homecontroller와 같이 homeBinding에서 처리 함..GetConnect 사용때문)
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Api.baseUrl;
  }

  //Task를 서버에서 가져옴
  Future<List<Task>> getTask(int pageNo, int countPerPage) async {
    try {
      final response = await get(
          "/todoApp/api/getTask?pageNo=${pageNo}&countPerPage=${countPerPage}");

      // print('responseBody : ${response.body}');

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        var jsonData = response.body['data'];
        //GetConnect 사용시에는 jsonDecode() 불필요
        return jsonData.map<Task>((tsk) => Task.fromJson(tsk)).toList();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  //Task 저장
  Future<String> saveTask(InputTask inputTask) async {
    try {
      final response = await post("/todoApp/api/saveTask", inputTask.toMap());

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        var result = response.body;

        if (result != null) {
          rtnMessage = 'success';
        } else {
          rtnMessage = 'fail';
        }
        return rtnMessage;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  //Task 수정
  Future<String> updateTask(InputTask updateTask) async {
    try {
      final response = await patch(
          "/todoApp/api/updateTask/${updateTask.taskId}", updateTask.toMap());

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        var result = response.body;

        if (result != null) {
          rtnMessage = 'success';
        } else {
          rtnMessage = 'fail';
        }
        return rtnMessage;
      }
    } catch (e) {
      return Future.error((e.toString()));
    }
  }

  //삭제
  Future<String> deleteTask(int taskId) async {
    try {
      final response = await delete("/todoApp/api/deleteTask/$taskId",
          contentType: 'application/json');

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        var result = response.body;

        if (result > 0) {
          rtnMessage = "success";
        } else {
          rtnMessage = "fail";
        }
        return rtnMessage;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
