import 'dart:convert';

// Function to deserialize JSON into a PostApiModel object.
PostApiModel postApiModelFromJson(String str) =>
    PostApiModel.fromJson(json.decode(str));

// Function to serialize a PostApiModel object into JSON.
String postApiModelToJson(PostApiModel data) => json.encode(data.toJson());

// Data model for representing a post API response.
class PostApiModel {
  String? id;
  DateTime? createdAt;

  PostApiModel({
    this.id,
    this.createdAt,
  });

  // Deserialize JSON into a PostApiModel object.
  factory PostApiModel.fromJson(Map<String, dynamic> json) => PostApiModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  // Serialize a PostApiModel object into JSON.
  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
      };
}
