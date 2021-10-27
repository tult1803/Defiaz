// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

List<Notifications> notificationsFromJson(String str) => List<Notifications>.from(json.decode(str).map((x) => Notifications.fromJson(x)));

String notificationsToJson(List<Notifications> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notifications {
  Notifications({
    this.content,
    this.tittle,
  });

  String? content;
  String? tittle;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    content: json["content"],
    tittle: json["tittle"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "tittle": tittle,
  };
}
