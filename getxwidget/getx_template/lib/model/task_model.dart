class InputTask {
  int? taskId;
  String? taskName;
  String? taskDescription;
  int? taskPriority;

  InputTask(
      {this.taskId, this.taskName, this.taskDescription, this.taskPriority});

  InputTask copy(
      {int? taskId,
      String? taskName,
      String? taskDescription,
      int? taskPriority}) {
    return InputTask(
        taskId: taskId ?? this.taskId,
        taskName: taskName ?? this.taskName,
        taskDescription: taskDescription ?? this.taskDescription,
        taskPriority: taskPriority ?? this.taskPriority);
  }

  Map<String, dynamic> toMap() {
    return {
      'taskId': this.taskId,
      'taskName': this.taskName,
      'taskDescription': this.taskDescription,
      'taskPriority': this.taskPriority
    };
  }
}
