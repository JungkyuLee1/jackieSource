// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CityResult cityResultFromJson(String str) => CityResult.fromJson(json.decode(str));

String cityResultToJson(CityResult data) => json.encode(data.toJson());

class CityResult {
  CityData cityData;
  String result;
  String message;

  CityResult({
    required this.cityData,
    required this.result,
    required this.message,
  });

  factory CityResult.fromJson(Map<String, dynamic> json) => CityResult(
    cityData: CityData.fromJson(json["cityData"]),
    result: json["result"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "cityData": cityData.toJson(),
    "result": result,
    "message": message,
  };
}

class CityData {
  int currentPage;
  int lastPage;
  List<City> cities;

  CityData({
    required this.currentPage,
    required this.lastPage,
    required this.cities,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
    currentPage: json["currentPage"],
    lastPage: json["lastPage"],
    cities: List<City>.from(json["data"].map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "lastPage": lastPage,
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
  };
}

class City {
  int cityId;
  int stateId;
  String cityName;
  int cityStatus;

  City({
    required this.cityId,
    required this.stateId,
    required this.cityName,
    required this.cityStatus,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    cityId: json["cityId"],
    stateId: json["stateId"],
    cityName: json["cityName"],
    cityStatus: json["cityStatus"],
  );

  Map<String, dynamic> toJson() => {
    "cityId": cityId,
    "stateId": stateId,
    "cityName": cityName,
    "cityStatus": cityStatus,
  };
}
