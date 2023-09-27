// To parse this JSON data, do
//
// final userResponceModel = userResponceModelFromJson(jsonString);

import 'dart:convert';

// Function to deserialize JSON into a UserResponseModel object.
UserResponseModel userResponseModelFromJson(String str) =>
    UserResponseModel.fromJson(json.decode(str));

// Function to serialize a UserResponseModel object into JSON.
String userResponseModelToJson(UserResponseModel data) => json.encode(data.toJson());

// Data model for representing a user response.
class UserResponseModel {
  String? name;
  String? job;
  String? id;
  String? createdAt;

  UserResponseModel({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  // Deserialize JSON into a UserResponseModel object.
  factory UserResponseModel.fromJson(Map<String, dynamic> json) => UserResponseModel(
    name: json["name"],
    job: json["job"],
    id: json["id"],
    createdAt: json["createdAt"],
  );

  // Serialize a UserResponseModel object into JSON.
  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt?.toString(),
  };
}
