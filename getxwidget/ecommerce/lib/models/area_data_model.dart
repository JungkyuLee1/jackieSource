// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AreaResult areaResultFromJson(String str) => AreaResult.fromJson(json.decode(str));

String areaResultToJson(AreaResult data) => json.encode(data.toJson());

class AreaResult {
  AreaData areaData;
  String result;
  String message;

  AreaResult({
    required this.areaData,
    required this.result,
    required this.message,
  });

  factory AreaResult.fromJson(Map<String, dynamic> json) => AreaResult(
    areaData: AreaData.fromJson(json["areaData"]),
    result: json["result"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "areaData": areaData.toJson(),
    "result": result,
    "message": message,
  };
}

class AreaData {
  int currentPage;
  int lastPage;
  List<Area> areas;

  AreaData({
    required this.currentPage,
    required this.lastPage,
    required this.areas,
  });

  factory AreaData.fromJson(Map<String, dynamic> json) => AreaData(
    currentPage: json["currentPage"],
    lastPage: json["lastPage"],
    areas: List<Area>.from(json["data"].map((x) => Area.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "lastPage": lastPage,
    "areas": List<dynamic>.from(areas.map((x) => x.toJson())),
  };
}

class Area {
  int areaId;
  int cityId;
  String areaName;
  String areaPinCode;
  int areaStatus;

  Area({
    required this.areaId,
    required this.cityId,
    required this.areaName,
    required this.areaPinCode,
    required this.areaStatus,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    areaId: json["areaId"],
    cityId: json["cityId"],
    areaName: json["areaName"],
    areaPinCode: json["areaPinCode"],
    areaStatus: json["areaStatus"],
  );

  Map<String, dynamic> toJson() => {
    "areaId": areaId,
    "cityId": cityId,
    "areaName": areaName,
    "areaPinCode": areaPinCode,
    "areaStatus": areaStatus,
  };
}
