import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/repository/task_repository.dart';

import '../model/task_model.dart';
import '../widegets/common_widgets.dart';

class HomeController extends GetxController {
  var lstTask = List<Task>.empty(growable: true).obs;
  var page = 1;
  var cntPerPage = 10;
  var isDataProcessing = false.obs;

  //Pagination
  var isMoreDataAvailable = true.obs;
  ScrollController scrollController = ScrollController();

  //Input item
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  var selectedPriority = 1.obs;
  InputTask? inputTask;
  var isProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    inputTask = InputTask();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTask(page, cntPerPage);
      paginateTask();
    });
  }

  //Task 가져오기(최초)
  void getTask(var pageNo, var countPerPage) {
    try {
      TaskRepository.to.getTask(pageNo, countPerPage).then((resp) {
        isDataProcessing(false);
        lstTask.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);

        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (e) {
      isDataProcessing(false);
      showSnackBar("Exception", e.toString(), Colors.red);
    }
  }

  void paginateTask() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        page++;
        getMoreTask(page, cntPerPage);
      }
    });
  }

  //Pagination 시 호출
  getMoreTask(var pageNo, var countPerPage) {
    try {
      TaskRepository.to.getTask(pageNo, countPerPage).then((resp) {
        if (resp.length > 0) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          showSnackBar('Message', "No more items", Colors.lightBlueAccent);
        }
        lstTask.addAll(resp);
      }, onError: (err) {
        isMoreDataAvailable(false);
        // showSnackBar('Error', err.toString(), Colors.red);
      });
    } catch (e) {
      isMoreDataAvailable(false);
      showSnackBar('Exception', e.toString(), Colors.red);
    }
  }

  //입력 내용 저장
  saveTask(InputTask inputTask) {
    try {
      isProcessing(true);
      TaskRepository.to.saveTask(inputTask).then((resp) {
        if (resp == 'success') {
          clearTextEditingControllers();
          isProcessing(false);

          showSnackBar("Add Task", 'Task added', Colors.green);
          lstTask.clear();

          refreshList();
        } else {
          showSnackBar('Add Task', 'Failed to add task', Colors.red);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar('Error', err.toString(), Colors.red);
      });
    } catch (e) {
      isProcessing(false);
      showSnackBar('Error', e.toString(), Colors.red);
    }
  }

  //내용 수정
  void updateTask(InputTask updateTask) {
    try {
      isProcessing(true);
      TaskRepository.to.updateTask(updateTask).then((resp) {
        if (resp == 'success') {
          clearTextEditingControllers();
          isProcessing(false);

          showSnackBar('Update Task', 'Task Updated', Colors.green);
          lstTask.clear();

          refreshList();
        } else {
          isProcessing(false);
          showSnackBar('Update Task', 'Failed to update task', Colors.red);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar('Error', err.toString(), Colors.red);
      });
    } catch (e) {
      isProcessing(false);
      showSnackBar('Error', e.toString(), Colors.red);
    }
  }

  //삭제
  void deleteTask(int taskId) {
    try {
      isDataProcessing(true);
      TaskRepository.to.deleteTask(taskId).then((resp) {
        isDataProcessing(false);

        if (resp == "success") {
          showSnackBar('Delete task', 'Task deleted', Colors.green);
          lstTask.clear();
          refreshList();
        } else {
          isDataProcessing(false);
          showSnackBar('Delete task', 'Delete failed', Colors.red);
        }
      });
    } catch (e) {
      isDataProcessing(false);
      showSnackBar('Error', e.toString(), Colors.red);
    }
  }

  //Data Refresh(저장,수정,삭제 후)
  void refreshList() async {
    page = 1;
    getTask(page, cntPerPage);
  }

  void clearTextEditingControllers() {
    titleEditingController.clear();
    descriptionEditingController.clear();
  }

  @override
  void onClose() {
    scrollController.dispose();
    titleEditingController.dispose();
    descriptionEditingController.dispose();
    super.onClose();
  }
}
