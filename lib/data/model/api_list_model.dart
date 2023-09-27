import 'dart:convert';

// Function to deserialize JSON into an ApiEntry object.
ApiEntry apiEntryFromJson(String str) => ApiEntry.fromJson(json.decode(str));

// Function to serialize an ApiEntry object into JSON.
String apiEntryToJson(ApiEntry data) => json.encode(data.toJson());

// Data model for representing API entries.
class ApiEntry {
  int? count;
  List<Entry>? entries;

  ApiEntry({
    this.count,
    this.entries,
  });

  // Deserialize JSON into an ApiEntry object.
  factory ApiEntry.fromJson(Map<String, dynamic> json) => ApiEntry(
        count: json["count"],
        entries: json["entries"] == null
            ? []
            : List<Entry>.from(json["entries"]!.map((x) => Entry.fromJson(x))),
      );

  // Serialize an ApiEntry object into JSON.
  Map<String, dynamic> toJson() => {
        "count": count,
        "entries": entries == null
            ? []
            : List<dynamic>.from(entries!.map((x) => x.toJson())),
      };
}

// Data model for representing individual API entries.
class Entry {
  String? api;
  String? description;
  Auth? auth;
  bool? https;
  Cors? cors;
  String? link;
  String? category;

  Entry({
    this.api,
    this.description,
    this.auth,
    this.https,
    this.cors,
    this.link,
    this.category,
  });

  // Deserialize JSON into an Entry object.
  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        api: json["API"],
        description: json["Description"],
        auth: authValues.map[json["Auth"]]!,
        https: json["HTTPS"],
        cors: corsValues.map[json["Cors"]]!,
        link: json["Link"],
        category: json["Category"],
      );

  // Serialize an Entry object into JSON.
  Map<String, dynamic> toJson() => {
        "API": api,
        "Description": description,
        "Auth": authValues.reverse[auth],
        "HTTPS": https,
        "Cors": corsValues.reverse[cors],
        "Link": link,
        "Category": category,
      };
}

// Enumeration for representing different authentication methods.
enum Auth { API_KEY, EMPTY, O_AUTH, USER_AGENT, X_MASHAPE_KEY }

// Mapping of authentication values to their respective enumeration values.
final authValues = EnumValues({
  "apiKey": Auth.API_KEY,
  "": Auth.EMPTY,
  "OAuth": Auth.O_AUTH,
  "User-Agent": Auth.USER_AGENT,
  "X-Mashape-Key": Auth.X_MASHAPE_KEY
});

// Enumeration for representing different CORS (Cross-Origin Resource Sharing) values.
enum Cors { NO, UNKNOWN, UNKOWN, YES }

// Mapping of CORS values to their respective enumeration values.
final corsValues = EnumValues({
  "no": Cors.NO,
  "unknown": Cors.UNKNOWN,
  "unkown": Cors.UNKOWN,
  "yes": Cors.YES
});

// Generic utility class for mapping enum values to and from their string representations.
class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  // Get a reverse mapping of values to strings.
  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
