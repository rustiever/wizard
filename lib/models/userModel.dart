import 'dart:convert';

import 'package:meta/meta.dart';

UserModel userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str) as Map<String, dynamic>);

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {@required this.name,
      @required this.uid,
      @required this.email,
      @required this.bookmarks});

  String name;
  String uid;
  String email;
  List<String> bookmarks;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json["name"] == null ? null : json["name"] as String,
      uid: json["uid"] == null ? null : json["uid"] as String,
      email: json["email"] == null ? null : json["email"] as String,
      bookmarks: json["bookmarks"] == null
          ? null
          : List<String>.from(json["bookmarks"].map((x) => x) as Iterable));

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "email": email,
        "bookmarks": bookmarks == null
            ? <String>[]
            : List<String>.from(
                bookmarks.map((x) => x),
              ),
      };
}
