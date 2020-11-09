import 'package:meta/meta.dart';

class PostModel {
  PostModel({
    @required this.uid,
    @required this.data,
    @required this.claps,
    @required this.name,
  });

  String uid;
  List data;
  int claps;
  String name;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        name: json["name"] == null ? null : json["name"] as String,
        uid: json["uid"] == null ? null : json["uid"] as String,
        data: json["data"] == null ? null : json["data"] as List,
        claps: json["claps"] == null ? null : json["claps"] as int,
      );

  Map<String, dynamic> toJson() =>
      {"uid": uid, "data": data, "claps": claps, "name": name};
}
