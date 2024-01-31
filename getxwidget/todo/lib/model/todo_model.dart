// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
  int id;
  int currentPage;
  List<Task> tasks;
  String firstPageUrl;
  int fromm;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String nextPageUrl;
  String pathh;
  int perPage;
  String prevPageUrl;
  int too;
  int total;

  Todo({
    required this.id,
    required this.currentPage,
    required this.tasks,
    required this.firstPageUrl,
    required this.fromm,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.pathh,
    required this.perPage,
    required this.prevPageUrl,
    required this.too,
    required this.total,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    currentPage: json["currentPage"],
    tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
    firstPageUrl: json["firstPageUrl"],
    fromm: json["fromm"],
    lastPage: json["lastPage"],
    lastPageUrl: json["lastPageUrl"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["nextPageUrl"],
    pathh: json["pathh"],
    perPage: json["perPage"],
    prevPageUrl: json["prevPageUrl"],
    too: json["too"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "currentPage": currentPage,
    "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
    "firstPageUrl": firstPageUrl,
    "fromm": fromm,
    "lastPage": lastPage,
    "lastPageUrl": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "nextPageUrl": nextPageUrl,
    "pathh": pathh,
    "perPage": perPage,
    "prevPageUrl": prevPageUrl,
    "too": too,
    "total": total,
  };
}

class Link {
  String url;
  String label;
  bool activee;

  Link({
    required this.url,
    required this.label,
    required this.activee,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    activee: json["activee"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "activee": activee,
  };
}

class Task {
  int taskId;
  String taskName;
  String taskDescription;
  int taskPriority;

  Task({
    required this.taskId,
    required this.taskName,
    required this.taskDescription,
    required this.taskPriority,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    taskId: json["taskId"],
    taskName: json["taskName"],
    taskDescription: json["taskDescription"],
    taskPriority: json["taskPriority"],
  );

  Map<String, dynamic> toJson() => {
    "taskId": taskId,
    "taskName": taskName,
    "taskDescription": taskDescription,
    "taskPriority": taskPriority,
  };
}
