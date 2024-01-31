import 'dart:convert';

StateModel stateModelFromJson(String str) => StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  List<StateDatum> stateData;

  StateModel({
    required this.stateData,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
    stateData: List<StateDatum>.from(json["stateData"].map((x) => StateDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stateData": List<dynamic>.from(stateData.map((x) => x.toJson())),
  };
}

class StateDatum {
  int stateId;
  int zoneId;
  String stateName;

  StateDatum({
    required this.stateId,
    required this.zoneId,
    required this.stateName,
  });

  factory StateDatum.fromJson(Map<String, dynamic> json) => StateDatum(
    stateId: json["stateId"],
    zoneId: json["zoneId"],
    stateName: json["stateName"],
  );

  Map<String, dynamic> toJson() => {
    "stateId": stateId,
    "zoneId": zoneId,
    "stateName": stateName,
  };
}
