// To parse this JSON data, do
//
//     final techEventsModel = techEventsModelFromJson(jsonString);

import 'dart:convert';

TechEventsModel techEventsModelFromJson(String str) =>
    TechEventsModel.fromJson(json.decode(str));

String techEventsModelToJson(TechEventsModel data) =>
    json.encode(data.toJson());

class TechEventsModel {
  String name;
  String date;
  String location;
  String description;

  TechEventsModel({
    required this.name,
    required this.date,
    required this.location,
    required this.description,
  });

  factory TechEventsModel.fromJson(Map<String, dynamic> json) =>
      TechEventsModel(
        name: json["name"],
        date: json["date"],
        location: json["location"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "date": date,
        "location": location,
        "description": description,
      };
}
