// import 'package:meta/meta.dart';

// class PostModel {
//   PostModel({
//     @required this.name,
//     @required this.uid,
//     @required this.data,
//     @required this.claps,
//   });

//   String name;
//   String uid;
//   List<int> data;
//   int claps;

//   factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
//         name: json["name"] == null ? null : json["name"] as String,
//         uid: json["uid"] == null ? null : json["uid"] as String,
//         data: json["data"] == null
//             ? null
//             : List<int>.from(json["data"].map((x) => x) as Iterable<int>),
//         claps: json["claps"] == null ? null : json["claps"] as int,
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "uid": uid,
//         "data": data == null
//             ? null
//             : List<int>.from(
//                 data.map((x) => x),
//               ),
//         "claps": claps,
//       };
// }

// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'package:meta/meta.dart';

class PostModel {
  PostModel({
    @required this.name,
    @required this.uid,
    @required this.data,
    @required this.claps,
  });

  String name;
  String uid;
  List<int> data;
  double claps;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        name: json["name"] as String,
        uid: json["uid"] as String,
        data: json["data"] == null
            ? null
            : List<int>.from(json["data"].map((x) => x) as Iterable),
        claps:
            json["claps"] == null ? null : json["claps"].toDouble() as double,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
        "claps": claps,
      };
}
