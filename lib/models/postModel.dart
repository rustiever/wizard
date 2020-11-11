import 'package:meta/meta.dart';

class PostModel {
  PostModel({
    @required this.uid,
    @required this.data,
    @required this.claps,
    @required this.finishTime,
    @required this.date,
    @required this.authorName,
    @required this.authorImage,
    @required this.title,
    // @required this.postImage
  });

  String uid;
  List<int> data;
  double claps;
  int finishTime;
  String date;
  String title;
  String authorName;
  String authorImage;
  // String postImage;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        uid: json["uid"] as String,
        data: json["data"] == null
            ? null
            : List<int>.from(json["data"].map((x) => x) as Iterable),
        claps:
            json["claps"] == null ? null : json["claps"].toDouble() as double,
        finishTime:
            json["finishTime"] == null ? null : json["finishTime"] as int,
        date: json["date"] as String,
        authorName:
            json["authorName"] == null ? null : json["authorName"] as String,
        title: json["title"] == null ? null : json["title"] as String,
        authorImage:
            json["authorImage"] == null ? null : json["authorImage"] as String,
        // postImage:  json["postImage"] as String
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
        "claps": claps,
        "finishTime": finishTime,
        "date": date,
        "authorName": authorName,
        "title": title,
        "authorImage": authorImage,
        // "postImage":postImage
      };
}
