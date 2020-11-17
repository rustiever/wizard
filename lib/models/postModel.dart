// import 'package:meta/meta.dart';

// class PostModel {
//   PostModel({
//     @required this.uid,
//     @required this.data,
//     @required this.claps,
//     @required this.finishTime,
//     @required this.date,
//     @required this.authorName,
//     @required this.authorImage,
//     @required this.title,
//     @required this.fileName,
//     this.postUid
//   });

//   String uid;
//   List<int> data;
//   double claps;
//   int finishTime;
//   String date;
//   String title;
//   String authorName;
//   String authorImage;
//   String fileName;
//   String postUid;
//   // String postImage;

//   factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
//         uid: json["uid"] as String,
//         data: json["data"] == null
//             ? null
//             : List<int>.from(json["data"].map((x) => x) as Iterable),
//         claps:
//             json["claps"] == null ? null : json["claps"].toDouble() as double,
//         finishTime:
//             json["finishTime"] == null ? null : json["finishTime"] as int,
//         date: json["date"] as String,
//         authorName:
//             json["authorName"] == null ? null : json["authorName"] as String,
//         title: json["title"] == null ? null : json["title"] as String,
//         authorImage:
//             json["authorImage"] == null ? null : json["authorImage"] as String,
//         fileName: json["fileName"] as String,
//         postUid: json["postUid"]== null?null:json["postUid"] as String
//         // postImage:  json["postImage"] as String
//       );

//   Map<String, dynamic> toJson() => {
//         "uid": uid,
//         "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
//         "claps": claps,
//         "finishTime": finishTime,
//         "date": date,
//         "authorName": authorName,
//         "title": title,
//         "authorImage": authorImage,
//         "fileName": fileName,
//         "postUid":postUid
//         // "postImage":postImage
//       };
// }
// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'package:meta/meta.dart';

class PostModel {
  PostModel({
    @required this.title,
    @required this.uid,
    @required this.data,
    @required this.claps,
    @required this.finishTime,
    @required this.authorName,
    @required this.authorImage,
    @required this.date,
    @required this.fileName,
    this.postUid,
  });

  String title;
  String uid;
  List<int> data;
  double claps;
  int finishTime;
  String authorName;
  String authorImage;
  String date;
  String postUid;
  String fileName;

  PostModel copyWith({
    String title,
    String uid,
    List<int> data,
    double claps,
    int finishTime,
    String authorName,
    String authorImage,
    String date,
    String postUid,
    String fileName,
  }) =>
      PostModel(
        title: title ?? this.title,
        uid: uid ?? this.uid,
        data: data ?? this.data,
        claps: claps ?? this.claps,
        finishTime: finishTime ?? this.finishTime,
        authorName: authorName ?? this.authorName,
        authorImage: authorImage ?? this.authorImage,
        date: date ?? this.date,
        fileName: fileName ?? this.fileName,
        postUid: postUid ?? this.postUid,
      );

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        title: json["title"] == null ? null : json["title"] as String,
        uid: json["uid"] == null ? null : json["uid"] as String,
        data: json["data"] == null
            ? null
            : List<int>.from(json["data"].map((x) => x) as Iterable),
        claps:
            json["claps"] == null ? null : json["claps"].toDouble() as double,
        finishTime:
            json["finishTime"] == null ? null : json["finishTime"] as int,
        authorName:
            json["authorName"] == null ? null : json["authorName"] as String,
        authorImage:
            json["authorImage"] == null ? null : json["authorImage"] as String,
        date: json["date"] == null ? null : json["date"] as String,
        postUid: json["postUid"] == null ? null : json["postUid"] as String,
        fileName: json["fileName"] == null ? null : json["fileName"] as String,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "uid": uid,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
        "claps": claps,
        "finishTime": finishTime,
        "authorName": authorName,
        "authorImage": authorImage,
        "date": date,
        "postUid": postUid,
        "fileName": fileName
      };
}
