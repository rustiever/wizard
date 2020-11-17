import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

Color grey = const Color(0xff757575);

const ampImg = 'assets/Amp.png';

const String userCollection = 'users';
const String postCollection = 'posts';
const String trendPostCollection = 'trends';
const String recomondsCollection = 'recomonds';
const String recentPostCollection = 'recents';

final MaterialColor randomColors =
    Colors.primaries[Random().nextInt(Colors.primaries.length)];

const namimage = {
  "Imran Lester":
      "https://images.unsplash.com/photo-1549913772-820279f909b7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1047&q=80",
  "Nate Tillman":
      "https://images.unsplash.com/photo-1605133104058-6fac9b38f522?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80",
  "Gregor Vu":
      "https://images.unsplash.com/photo-1605043269924-32c9b0226efe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80",
  "Emily-Jane Beaumont":
      "https://images.unsplash.com/photo-1602995660357-20e5ebaa4d37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  "Corban Fenton":
      "https://images.unsplash.com/photo-1604955620083-115f4ffe676c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  "Nathaniel Parry":
      "https://images.unsplash.com/photo-1603217149748-5890cb3dcd4d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  "Madeeha Stark":
      "https://images.unsplash.com/photo-1604865649875-4ed2c01dcc2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=630&q=80",
  "Lynda Bautista":
      "https://images.unsplash.com/photo-1604510719890-44e6d7ad058c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=602&q=80",
  "Fraser Dickerson":
      "https://images.unsplash.com/photo-1586536266484-5d229c02a3c1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  "Elisa Romero":
      "https://images.unsplash.com/photo-1604520164966-8ca929961ebe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80"
};

const profileMenu = [
  "New story",
  "Stories",
  "Stats",
  "Design",
  "Settings",
  "Reading list",
  "Publications",
  "Customize your interests",
  "Wizard Partner Program",
  "Help",
  "Sign out"
];

const bottomMenu = [
  "Help",
  "Status",
  "Writers",
  "Blog",
  "Careers",
  "Privacy",
  "Terms",
  "About"
];

const mimeMD = "text/x-web-markdown";
String postImage =
        'https://images.unsplash.com/photo-1555212697-194d092e3b8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    authorName = 'Sharan',
    authorImage =
        'https://images.unsplash.com/photo-1504593811423-6dd665756598?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
    title = 'title of this title of this title',
    content =
        'Before  (or have an existing) Flutter project and  If you do not meet these prerequisites, follow the links below',
    readTime = '5',
    community = 'Flutter Community',
    date = "Sep 30";
