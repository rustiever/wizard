import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizard/controllers/controllers.dart';
import 'package:wizard/widgets/widgets.dart';

import '../constants.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () {
                  if (controller.trendingPosts.isEmpty) {
                    return CustomProgressIndicator();
                  }
                  return Post1(
                    postModel: controller.trendingPosts[Random().nextInt(
                      controller.trendingPosts.length,
                    )],
                  );
                },
              ),
              const SizedBox(
                height: 600,
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 0.5,
                  width: 5,
                ),
              ),
              Try(
                controller: controller,
              ),
              const SizedBox(
                height: 600,
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 0.5,
                  width: 5,
                ),
              ),
              Try(controller: controller)
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.5,
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 66.0, top: 20, bottom: 20),
            child: ListTile(
              title: const Text(
                "TRENDING ON WIZARD",
                style: TextStyle(
                    fontFamily: "Helvetica Neue",
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              leading: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[200],
                child: const Icon(
                  Icons.stacked_line_chart_outlined,
                  // size: 20,
                  color: Color(0xff4ba97d),
                ),
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: const [
          //         Post2(
          //           number: '01',
          //         ),
          //         Post2(
          //           number: '02',
          //         )
          //       ],
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: const [
          //         Post2(
          //           number: '03',
          //         ),
          //         Post2(
          //           number: '04',
          //         )
          //       ],
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: const [
          //         Post2(
          //           number: '05',
          //         ),
          //         Post2(
          //           number: '06',
          //         )
          //       ],
          //     ),
          //   ],
          // ),
          const Divider(
            color: Colors.black,
            thickness: 0.5,
            height: 5,
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 660,
                padding: const EdgeInsets.fromLTRB(90, 0, 60, 50),
                // height: 200,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                      20,
                      (index) => const Post3(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                // height: 150,
                width: 450,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: 450,
                      color: const Color(0xfffafafa),
                      child: const ListTile(
                        isThreeLine: true,
                        contentPadding: EdgeInsets.all(15),
                        dense: true,
                        title: Text(
                          "Bookmark stories for later",
                          style: TextStyle(
                              fontFamily: "Helvetica Neue",
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 18.0),
                          child: Text(
                            'Start saving stories by clicking the bookmark icon and you’ll find them in Reading List.',
                            style: TextStyle(
                                fontFamily: "Helvetica Neue",
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        leading: Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Icon(
                            Icons.book_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      runSpacing: 5,
                      children: List.generate(
                        8,
                        (index) => FlatButton(
                          onPressed: () {},
                          child: Text(bottomMenu[index]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // Center(
          //   child: RaisedButton(
          //     onPressed: () async {
          //       await FirebaseService().signOut();
          //     },
          //     child: const Text('sign out'),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Try extends StatelessWidget {
  const Try({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.trendingPosts.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Post2(
              postModel: controller.trendingPosts[Random().nextInt(
                controller.trendingPosts.length,
              )],
            ),
            Post2(
              postModel: controller.trendingPosts[Random().nextInt(
                controller.trendingPosts.length,
              )],
            ),
            Post2(
              postModel: controller.trendingPosts[Random().nextInt(
                controller.trendingPosts.length,
              )],
            ),
            Post2(
              postModel: controller.trendingPosts[Random().nextInt(
                controller.trendingPosts.length,
              )],
            ),
          ],
        );
      },
    );
  }
}
