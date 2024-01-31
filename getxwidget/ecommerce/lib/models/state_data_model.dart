// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

StateDataModel stateDataModelFromJson(String str) => StateDataModel.fromJson(json.decode(str));

String stateDataModelToJson(StateDataModel data) => json.encode(data.toJson());

class StateDataModel {
  int currentPage;
  List<StateD> state;
  String result;
  String message;

  StateDataModel({
    required this.currentPage,
    required this.state,
    required this.result,
    required this.message,
  });

  factory StateDataModel.fromJson(Map<String, dynamic> json) => StateDataModel(
    currentPage: json["currentPage"],
    state: List<StateD>.from(json["data"].map((x) => StateD.fromJson(x))),
    result: json["result"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "state": List<dynamic>.from(state.map((x) => x.toJson())),
    "result": result,
    "message": message,
  };
}

class StateD {
  int stateId;
  String stateName;
  int stateStatus;

  StateD({
    required this.stateId,
    required this.stateName,
    required this.stateStatus,
  });

  factory StateD.fromJson(Map<String, dynamic> json) => StateD(
    stateId: json["stateId"],
    stateName: json["stateName"],
    stateStatus: json["stateStatus"],
  );

  Map<String, dynamic> toJson() => {
    "stateId": stateId,
    "stateName": stateName,
    "stateStatus": stateStatus,
  };
}
