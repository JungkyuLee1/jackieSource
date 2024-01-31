import 'dart:convert';

ZoneModel zoneModelFromJson(String str) => ZoneModel.fromJson(json.decode(str));

String zoneModelToJson(ZoneModel data) => json.encode(data.toJson());

class ZoneModel{
  List<Zone> zoneData;

  ZoneModel({
    required this.zoneData,
  });

  factory ZoneModel.fromJson(Map<String, dynamic> json) => ZoneModel(
    zoneData: List<Zone>.from(json["zoneData"].map((x) => Zone.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "zoneData": List<dynamic>.from(zoneData.map((x) => x.toJson())),
  };
}

class Zone {
  int zoneId;
  String zoneName;

  Zone({
    required this.zoneId,
    required this.zoneName,
  });

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
    zoneId: json["zoneId"],
    zoneName: json["zoneName"],
  );

  Map<String, dynamic> toJson() => {
    "zoneId": zoneId,
    "zoneName": zoneName,
  };
}
