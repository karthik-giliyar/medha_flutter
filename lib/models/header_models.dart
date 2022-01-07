import 'dart:convert';

List<Header> headerFromJson(String str) =>
    List<Header>.from(json.decode(str).map((x) => Header.fromJson(x)));

String headerToJson(List<Header> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Header {
  Header({
    required this.id,
    required this.heading,
  });

  String id;
  String heading;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        id: json["id"],
        heading: json["heading"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "heading": heading, 
      };
}
