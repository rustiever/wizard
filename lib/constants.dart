import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

Color grey = const Color(0xff757575);

const ampImg = 'assets/Amp.png';

const String userCollection = 'users';
const String postCollection = 'posts';
const String trendPostCollection = 'trends';

final MaterialColor randomColors =
    Colors.primaries[Random().nextInt(Colors.primaries.length)];

const profileMenu = [
  "New story",
  "Stories",
  "Stats",
  "Design",
  "Settings",
  "Reading list",
  "Publications",
  "Customize your interests",
  "Medium Partner Program",
  "Help",
  "Sign out"
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
