import 'dart:convert';

List<Popular> popularFromJson(String str) => List<Popular>.from(json.decode(str).map((x) => Popular.fromJson(x)));

String popularToJson(List<Popular> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Popular {
  int id;
  String name;
  String permalink;
  DateTime startDate;
  dynamic endDate;
  String country;
  String network;
  String status;
  String imageThumbnailPath;

  Popular({
    required this.id,
    required this.name,
    required this.permalink,
    required this.startDate,
    required this.endDate,
    required this.country,
    required this.network,
    required this.status,
    required this.imageThumbnailPath,
  });

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
    id: json["id"],
    name: json["name"],
    permalink: json["permalink"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: json["end_date"],
    country: json["country"],
    network: json["network"],
    status: json["status"],
    imageThumbnailPath: json["image_thumbnail_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "permalink": permalink,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": endDate,
    "country": country,
    "network": network,
    "status": status,
    "image_thumbnail_path": imageThumbnailPath,
  };
}
