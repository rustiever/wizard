import 'package:meta/meta.dart';

class PostModel {
  PostModel({
    @required this.name,
    @required this.uid,
    @required this.data,
    @required this.claps,
    @required this.finishTime,
    @required this.date,
  });

  String name;
  String uid;
  List<int> data;
  double claps;
  int finishTime;
  String date;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      name: json["name"] as String,
      uid: json["uid"] as String,
      data: json["data"] == null
          ? null
          : List<int>.from(json["data"].map((x) => x) as Iterable),
      claps: json["claps"] == null ? null : json["claps"].toDouble() as double,
      finishTime: json["finishTime"] == null ? null : json["finishTime"] as int,
      date: json["date"] as String);

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
        "claps": claps,
        "finishTime": finishTime,
        "date": date
      };
}
