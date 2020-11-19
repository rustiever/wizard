import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:wizard/controllers/controllers.dart';
import 'package:wizard/models/models.dart';
import 'package:wizard/routes.dart';
import '../constants.dart';
import 'widgets.dart';

class Post1 extends StatelessWidget {
  final String content;

  final PostModel postModel;
  // final void Function() onTap;

  void onTap() {
    Get.toNamed(postRoute, arguments: postModel);
  }

  const Post1(
      {Key key, this.content = 'To read more tap on the Story', this.postModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                height: 400,
                width: 400,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: MarkdownGenerator(
                    data: utf8.decode(postModel.data),
                  ).widgets[1],
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(postModel.authorImage),
                radius: 17.0,
              ),
              const SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: postModel.authorName,
                      style: const TextStyle(
                          fontFamily: "Helvetica Neue", color: Colors.black),
                    ),
                    const TextSpan(
                      text: ' in ',
                      style: TextStyle(
                          fontFamily: "Helvetica Neue", color: Colors.grey),
                    ),
                    TextSpan(
                      text: community,
                      style: const TextStyle(
                          fontFamily: "Helvetica Neue", color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              postModel.title,
              // textAlign: TextAlign.start,
              style: const TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              content,
              style: const TextStyle(
                  fontFamily: "Times New Roman",
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400),
            ),
          ),
          // const SizedBox(
          //   width: 50,
          // ),
          const Spacer(
              // flex: 2,
              ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'Read More . ${postModel.finishTime} min read ',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: "Helvetica Neue",
                      fontSize: 13),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.star_rate,
                  size: 13,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}

class Post2 extends StatelessWidget {
  final String community, number;
  final PostModel postModel;

  void onTap() {
    Get.toNamed(postRoute, arguments: postModel);
  }

  const Post2(
      {Key key,
      this.community = 'Wizard Community',
      this.number,
      @required this.postModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: SizedBox(
        height: 150,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  if (number != null)
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xffe6e6e6),
                      child: Text(
                        number,
                        textScaleFactor: 2,
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  if (number != null)
                    const SizedBox(
                      width: 25,
                    )
                  else
                    const SizedBox.shrink(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(postModel.authorImage),
                              radius: 15.0,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: postModel.authorName,
                                        style: const TextStyle(
                                            fontFamily: "Helvetica Neue",
                                            color: Colors.black),
                                      ),
                                      const TextSpan(
                                        text: ' in ',
                                        style: TextStyle(
                                            fontFamily: "Helvetica Neue",
                                            color: Colors.grey),
                                      ),
                                      TextSpan(
                                        text: community,
                                        style: const TextStyle(
                                            fontFamily: "Helvetica Neue",
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: onTap,
                          child: SizedBox(
                            width: 230,
                            child: Text(
                              postModel.title,
                              style: const TextStyle(
                                  fontFamily: "Helvetica Neue",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: onTap,
                          child: Row(
                            children: [
                              Text(
                                '${postModel.date} . ${postModel.finishTime} min read',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Helvetica Neue",
                                    fontSize: 13),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              if (Random().nextBool())
                                const Icon(
                                  Icons.star_rate,
                                  size: 13,
                                  color: Colors.grey,
                                )
                              else
                                const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 150,
                      height: 100,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: MarkdownGenerator(
                          data: utf8.decode(
                            postModel.data,
                          ),
                        ).widgets[1],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (number == null)
              const Divider(
                color: Colors.blueGrey,
                thickness: 0.5,
              )
            else
              const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class Post3 extends StatelessWidget {
  final String postImage,
      authorName,
      authorImage,
      title,
      content,
      readTime,
      community,
      number,
      date;
  final void Function() onTap;
  const Post3(
      {Key key,
      this.postImage =
          'https://images.unsplash.com/photo-1555212697-194d092e3b8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      this.authorName = 'Sharan',
      this.authorImage =
          'https://images.unsplash.com/photo-1504593811423-6dd665756598?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      this.title = 'title of this title of this title',
      this.content =
          'Before  (or have an existing) Flutter project and  If you do not meet these prerequisites, follow the links below',
      this.readTime = '5',
      this.community = 'Flutter Community',
      this.onTap,
      this.number,
      this.date = "Sep 30"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(authorImage),
                  radius: 12.0,
                ),
                const SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: authorName,
                        style: const TextStyle(
                            fontFamily: "Helvetica Neue", color: Colors.black),
                      ),
                      const TextSpan(
                        text: ' in ',
                        style: TextStyle(
                            fontFamily: "Helvetica Neue", color: Colors.grey),
                      ),
                      TextSpan(
                        text: community,
                        style: const TextStyle(
                            fontFamily: "Helvetica Neue", color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: onTap,
              child: SizedBox(
                width: 500,
                child: Text(
                  title + title,
                  style: const TextStyle(
                      fontFamily: "Helvetica Neue",
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: onTap,
              child: SizedBox(
                width: 500,
                child: Text(
                  content,
                  style: const TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    '$date . $readTime min read',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: "Helvetica Neue",
                        fontSize: 13),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  if (Random().nextBool())
                    const Icon(
                      Icons.star_rate,
                      size: 13,
                      color: Colors.grey,
                    )
                  else
                    const SizedBox.shrink(),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz_rounded),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 200,
          height: 160,
          child: Image.network(
            postImage,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class Post2Widgets extends StatelessWidget {
  const Post2Widgets({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.posts.isEmpty) {
          return CustomProgressIndicator();
        }
        return Column(
          children: [
            Post2(
              postModel: controller.posts[1],
            ),
            Post2(
              postModel: controller.posts[2],
            ),
            Post2(
              postModel: controller.posts[3],
            ),
            Post2(
              postModel: controller.posts[4],
            ),
          ],
        );
      },
    );
  }
}

class Post2WidgetsB extends StatelessWidget {
  const Post2WidgetsB({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.posts.isEmpty) {
          return CustomProgressIndicator();
        }
        return Column(
          children: [
            Post2(
              postModel: controller.posts[5],
            ),
            Post2(
              postModel: controller.posts[6],
            ),
            Post2(
              postModel: controller.posts[7],
            ),
            Post2(
              postModel: controller.posts[8],
            ),
          ],
        );
      },
    );
  }
}
