import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/component/message_popup.dart';

import '../controller/home_controller.dart';
import '../model/task_model.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  Widget _taskHeader(int num) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Active Task :',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.green)),
          SizedBox(
            width: 8,
          ),
          Text(
            num.toString(),
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green),
          )
        ],
      ),
    );
  }

  _circleOne(
      String mark, Color backgroundColor, double radius, double fontSize) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Text(
        mark,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }

  _levelOne(String mark, int? level, Color backgroundColor, double radius,
      double fontSize) {
    return Expanded(
      child: Row(
        children: [
          _circleOne(mark, backgroundColor, radius, fontSize),
          SizedBox(
            width: 10,
          ),
          Text(
            level.toString(),
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: backgroundColor),
          )
        ],
      ),
    );
  }

  Widget _taskLevel() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _levelOne('H', controller.lstTask[3].taskPriority == 1 ? 1 : 0,
              Colors.green, 32, 20),
          _levelOne('M', controller.lstTask[3].taskPriority == 2 ? 1 : 0,
              Colors.orange, 32, 20),
          _levelOne('L', controller.lstTask[3].taskPriority >= 3 ? 1 : 0,
              Colors.purple, 32, 20),
        ],
      ),
    );
  }

  _taskList() {
    return Expanded(
      child: ListView.builder(
          controller: controller.scrollController,
          itemCount:
              controller.lstTask.length < 0 ? 0 : controller.lstTask.length,
          itemBuilder: (context, index) {
            if (index == controller.lstTask.length - 1 &&
                controller.isMoreDataAvailable.value == true) {
              return Center(child: CircularProgressIndicator());
            }
            final task = controller.lstTask[index];

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _circleOne(
                          task.taskPriority == 1
                              ? 'H'
                              : task.taskPriority == 2
                                  ? 'M'
                                  : 'L',
                          task.taskPriority == 1
                              ? Colors.green
                              : task.taskPriority == 2
                                  ? Colors.orange
                                  : Colors.purple,
                          23,
                          14),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.taskName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            task.taskDescription,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _displayEditTaskWindow(task.taskId, task.taskName,
                              task.taskDescription, task.taskPriority);
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _displayDeleteTaskDialog(task.taskId);
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  //최초 저장
  _saveTask({String? name, String? description, int? priority}) {
    InputTask newInputTask = controller.inputTask!.copy(
        taskId: 0,
        taskName: name,
        taskDescription: description,
        taskPriority: priority);

    controller.saveTask(newInputTask);
    Get.back();
  }

  //수정
  _updateTask({int? id, String? name, String? description, int? priority}) {
    InputTask updateTask = controller.inputTask!.copy(
        taskId: id,
        taskName: name,
        taskDescription: description,
        taskPriority: priority);

    controller.updateTask(updateTask);
    Get.back();
  }

  //신규 입력
  _displayAddTaskWindow() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Task',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.titleEditingController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.descriptionEditingController,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                          value: "1", child: Text('High Priority')),
                      DropdownMenuItem(
                          value: "2", child: Text('Medium Priority')),
                      DropdownMenuItem(value: "3", child: Text('Low Priority')),
                    ],
                    value: controller.selectedPriority.value.toString(),
                    onChanged: (selectedValue) {
                      controller.selectedPriority.value =
                          int.parse(selectedValue!);
                    },
                    hint: Text('Select Task Priority'),
                    isExpanded: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isProcessing.value == false) {
                      _saveTask(
                        name: controller.titleEditingController.text,
                        description:
                            controller.descriptionEditingController.text,
                        priority: controller.selectedPriority.value,
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.grey[400]),
                    child: Center(
                        child: Text(controller.isProcessing.value
                            ? 'Processing'
                            : 'Save')),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  //수정
  _displayEditTaskWindow(
      int taskId, String taskName, String taskDescription, int taskPriority) {
    controller.titleEditingController.text = taskName;
    controller.descriptionEditingController.text = taskDescription;
    controller.selectedPriority.value = taskPriority;

    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Task',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.titleEditingController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.descriptionEditingController,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                          value: "1", child: Text('High Priority')),
                      DropdownMenuItem(
                          value: "2", child: Text('Medium Priority')),
                      DropdownMenuItem(value: "3", child: Text('Low Priority')),
                    ],
                    value: controller.selectedPriority.value.toString(),
                    onChanged: (selectedValue) {
                      controller.selectedPriority.value =
                          int.parse(selectedValue!);
                    },
                    hint: Text('Select Task Priority'),
                    isExpanded: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isProcessing.value == false) {
                      _updateTask(
                        id: taskId,
                        name: controller.titleEditingController.text,
                        description:
                            controller.descriptionEditingController.text,
                        priority: controller.selectedPriority.value,
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.grey[400]),
                    child: Center(
                        child: Text(controller.isProcessing.value
                            ? 'Processing'
                            : 'Update')),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  //삭제
  _displayDeleteTaskDialog(int taskId) {
    Get.dialog(MessagePopup('Delete Task', 'Are you sure to delete task?',
        okCallback: () {
      controller.deleteTask(taskId);
      Get.back();
    }, cancelCallback: () {
      Get.back();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isDataProcessing == true
            ? Center(child: CircularProgressIndicator())
            : controller.lstTask.length > 0
                ? Container(
                    child: Column(
                      children: [
                        _taskHeader(controller.lstTask.length),
                        SizedBox(
                          height: 10,
                        ),
                        _taskLevel(),
                        SizedBox(
                          height: 10,
                        ),
                        _taskList(),
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                      'Data not found',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _displayAddTaskWindow();
        },
        label: Text('Add Task'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
