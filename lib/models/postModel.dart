import 'package:meta/meta.dart';

class PostModel {
  PostModel({
    @required this.title,
    @required this.ownerUid,
    @required this.data,
    @required this.claps,
    @required this.finishTime,
    @required this.authorName,
    @required this.authorImage,
    @required this.date,
    @required this.fileName,
    this.postUid,
    this.bookmarked,
  });

  String title;
  String ownerUid;
  List<int> data;
  double claps;
  int finishTime;
  String authorName;
  String authorImage;
  String date;
  String postUid;
  String fileName;
  bool bookmarked;

  PostModel copyWith({
    String title,
    String ownerUid,
    List<int> data,
    double claps,
    int finishTime,
    String authorName,
    String authorImage,
    String date,
    String postUid,
    String fileName,
    bool bookmarked,
  }) =>
      PostModel(
        title: title ?? this.title,
        ownerUid: ownerUid ?? this.ownerUid,
        data: data ?? this.data,
        claps: claps ?? this.claps,
        finishTime: finishTime ?? this.finishTime,
        authorName: authorName ?? this.authorName,
        authorImage: authorImage ?? this.authorImage,
        date: date ?? this.date,
        fileName: fileName ?? this.fileName,
        postUid: postUid ?? this.postUid,
        bookmarked: bookmarked ?? this.bookmarked,
      );

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        title: json["title"] == null ? null : json["title"] as String,
        ownerUid: json["uid"] == null ? null : json["uid"] as String,
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
        bookmarked:
            json["bookmarked"] == null ? null : json["bookmared"] as bool,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "uid": ownerUid,
        "data": data == null
            ? null
            : List<dynamic>.from(
                data.map((x) => x),
              ),
        "claps": claps,
        "finishTime": finishTime,
        "authorName": authorName,
        "authorImage": authorImage,
        "date": date,
        "postUid": postUid,
        "fileName": fileName,
        "bookmarked": bookmarked
      };
}
