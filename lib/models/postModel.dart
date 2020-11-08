import 'dart:convert';
import 'package:meta/meta.dart';

PostModel postModelFromJson(String str) =>
    PostModel.fromJson(json.decode(str) as Map<String, dynamic>);

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    @required this.uid,
    @required this.data,
    @required this.claps,
    @required this.name,
  });

  String uid;
  String data;
  int claps;
  String name;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        name: json["name"] == null ? null : json["name"] as String,
        uid: json["uid"] == null ? null : json["uid"] as String,
        data: json["data"] == null ? null : json["data"] as String,
        claps: json["claps"] == null ? null : json["claps"] as int,
      );

  Map<String, dynamic> toJson() =>
      {"uid": uid, "data": data, "claps": claps, "name": name};
}
