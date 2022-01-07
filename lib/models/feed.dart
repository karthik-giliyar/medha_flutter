import 'dart:convert';

List<Feed> feedFromJson(String str) => List<Feed>.from(json.decode(str).map((x) => Feed.fromJson(x)));

String feedToJson(List<Feed> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Feed{
    Feed({
        required this.id,
        required this.imageUrl,
        required this.title,
        required this.desc,
        required this.date,
    });

    String id;
    String imageUrl;
    String title;
    String desc;
    String date;

    factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        id: json["id"],
        imageUrl: json["imageUrl"],
        title: json["title"],
        desc: json["desc"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "title": title,
        "desc": desc,
        "date": date,
    };
}







