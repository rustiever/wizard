import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:wizard/services/firebaseServices.dart';

import '../constants.dart';
import '../controllers/controllers.dart';
import '../models/models.dart';
import '../routes.dart';
import 'widgets.dart';

class Post1 extends GetView<HomeController> {
  final String content;

  final PostModel postModel;

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
                    data: utf8.decode(controller.posts[0].value.data),
                  ).widgets[1],
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(controller.posts[0].value.authorImage),
                radius: 17.0,
              ),
              const SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: controller.posts[0].value.authorName,
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
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'Read More . ${controller.posts[0].value.finishTime} min read ',
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
                ),
                const SizedBox(
                  width: 20,
                ),
                HomeBookMarkWidget(controller: controller, index: 0)
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

class Post2 extends GetView<HomeController> {
  final String community, number;
  final PostModel postModel;
  final int index;

  void onTap() {
    Get.toNamed(postRoute, arguments: postModel);
  }

  const Post2(
      {Key key,
      @required this.index,
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
                              HomeBookMarkWidget(
                                  controller: controller, index: index)
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

class Post4 extends GetView<BookMarkController> {
  final int index;
  void onTap() {
    Get.toNamed(postRoute, arguments: controller.posts[index]);
  }

  const Post4({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 12.0, 0.0, 12.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(controller.posts[index].value.authorImage),
                    radius: 12.0,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: controller.posts[index].value.authorName,
                          style: const TextStyle(
                              fontFamily: "Helvetica Neue",
                              color: Colors.black),
                        ),
                        const TextSpan(
                          text: ' in ',
                          style: TextStyle(
                              fontFamily: "Helvetica Neue", color: Colors.grey),
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
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: onTap,
                child: SizedBox(
                  width: 350,
                  child: Text(
                    controller.posts[index].value.title,
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
                child: Row(
                  children: [
                    Text(
                      '${controller.posts[index].value.date} . ${controller.posts[index].value.finishTime} min read',
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
                    BookMarkWidget(
                      controller: controller,
                      index: index,
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
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 200,
            height: 160,
            child: FittedBox(
              fit: BoxFit.fill,
              child: MarkdownGenerator(
                data: utf8.decode(
                  controller.posts[index].value.data,
                ),
              ).widgets[1],
            ),
          ),
        ],
      ),
    );
  }
}

class BookMarkWidget extends StatelessWidget {
  const BookMarkWidget({
    Key key,
    @required this.controller,
    @required this.index,
  }) : super(key: key);

  final BookMarkController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: controller.posts[index].value.bookmarked
            ? const Icon(
                Icons.bookmark,
                color: Color(0xff4ba97d),
              )
            : const Icon(Icons.bookmark_border),
        onPressed: () async {
          if (controller.posts[index].value.bookmarked) {
            controller.posts[index].value.bookmarked =
                !controller.posts[index].value.bookmarked;
            controller.posts[index].refresh();
            await FirebaseFirestore.instance
                .collection(userCollection)
                .doc(FirebaseService.instance.currentUser.uid)
                .update(
              {
                "bookmarks": FieldValue.arrayRemove(
                    [controller.posts[index].value.postUid])
              },
            );
            print('yes');
          } else {
            print('no');
            controller.posts[index].value.bookmarked =
                !controller.posts[index].value.bookmarked;
            controller.posts[index].refresh();
            await FirebaseFirestore.instance
                .collection(userCollection)
                .doc(FirebaseService.instance.currentUser.uid)
                .update(
              {
                "bookmarks": FieldValue.arrayUnion(
                    [controller.posts[index].value.postUid])
              },
            );
          }
        },
      ),
    );
  }
}

class HomeBookMarkWidget extends StatelessWidget {
  const HomeBookMarkWidget({
    Key key,
    @required this.controller,
    @required this.index,
  }) : super(key: key);

  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: controller.posts[index].value.bookmarked
            ? const Icon(
                Icons.bookmark,
                color: Color(0xff4ba97d),
              )
            : const Icon(Icons.bookmark_border),
        onPressed: () async {
          if (controller.posts[index].value.bookmarked) {
            controller.posts[index].value.bookmarked =
                !controller.posts[index].value.bookmarked;
            controller.posts[index].refresh();
            await FirebaseFirestore.instance
                .collection(userCollection)
                .doc(FirebaseService.instance.currentUser.uid)
                .update(
              {
                "bookmarks": FieldValue.arrayRemove(
                    [controller.posts[index].value.postUid])
              },
            );
            print('yes');
          } else {
            print('no');
            controller.posts[index].value.bookmarked =
                !controller.posts[index].value.bookmarked;
            controller.posts[index].refresh();
            await FirebaseFirestore.instance
                .collection(userCollection)
                .doc(FirebaseService.instance.currentUser.uid)
                .update(
              {
                "bookmarks": FieldValue.arrayUnion(
                    [controller.posts[index].value.postUid])
              },
            );
          }
        },
      ),
    );
  }
}

class Post3 extends GetView<HomeController> {
  final PostModel postModel;

  const Post3({Key key, this.postModel}) : super(key: key);
  void onTap() {
    Get.toNamed(postRoute, arguments: postModel);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 12.0, 0.0, 12.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(postModel.authorImage),
                    radius: 12.0,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RichText(
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
                              fontFamily: "Helvetica Neue", color: Colors.grey),
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
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: onTap,
                child: SizedBox(
                  width: 350,
                  child: Text(
                    postModel.title,
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
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      icon: postModel.bookmarked
                          ? const Icon(
                              Icons.bookmark,
                              color: Color(0xff4ba97d),
                            )
                          : const Icon(Icons.bookmark_border),
                      onPressed: () async {
                        if (postModel.bookmarked) {
                          await FirebaseFirestore.instance
                              .collection(userCollection)
                              .doc(FirebaseService.instance.currentUser.uid)
                              .update(
                            {
                              "bookmarks":
                                  FieldValue.arrayRemove([postModel.postUid])
                            },
                          );
                          print('yes');
                        } else {
                          print('no');
                          await FirebaseFirestore.instance
                              .collection(userCollection)
                              .doc(FirebaseService.instance.currentUser.uid)
                              .update(
                            {
                              "bookmarks":
                                  FieldValue.arrayUnion([postModel.postUid])
                            },
                          );
                        }
                      },
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
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 200,
            height: 160,
            child: FittedBox(
              fit: BoxFit.fill,
              child: MarkdownGenerator(
                data: utf8.decode(
                  postModel.data,
                ),
              ).widgets[1],
            ),
          ),
        ],
      ),
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
              postModel: controller.posts[1].value,
              index: 1,
            ),
            Post2(
              postModel: controller.posts[2].value,
              index: 2,
            ),
            Post2(
              postModel: controller.posts[3].value,
              index: 3,
            ),
            Post2(
              postModel: controller.posts[4].value,
              index: 4,
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
              postModel: controller.posts[5].value,
              index: 5,
            ),
            Post2(
              postModel: controller.posts[6].value,
              index: 6,
            ),
            Post2(
              postModel: controller.posts[7].value,
              index: 7,
            ),
            Post2(
              postModel: controller.posts[8].value,
              index: 8,
            ),
          ],
        );
      },
    );
  }
}
