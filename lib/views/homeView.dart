import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizard/controllers/controllers.dart';
import 'package:wizard/widgets/widgets.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: CustomAppBar(),
      body: Obx(
        () {
          if (controller.posts.isEmpty) {
            return CustomProgressIndicator();
          }
          return RefreshIndicator(
            onRefresh: () async => controller.shuffle(),
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 620,
                        child: Obx(
                          () {
                            if (controller.posts.isEmpty) {
                              return CustomProgressIndicator();
                            }
                            return Post1(
                              postModel: controller.posts[0].value,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 650,
                      child: VerticalDivider(
                        color: Colors.black,
                        // thickness: 5,
                      ),
                    ),
                    Expanded(
                      child: Post2Widgets(controller: controller),
                    ),
                    const SizedBox(
                      height: 650,
                      child: VerticalDivider(
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Post2WidgetsB(controller: controller),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
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
                        color: Color(0xff4ba97d),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () {
                    if (controller.posts.isEmpty) {
                      return CustomProgressIndicator();
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Post2(
                                number: '01',
                                postModel: controller.posts[9].value,
                                index: 9,
                              ),
                              Post2(
                                number: '02',
                                postModel: controller.posts[10].value,
                                index: 10,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Post2(
                                number: '03',
                                postModel: controller.posts[11].value,
                                index: 11,
                              ),
                              Post2(
                                number: '04',
                                postModel: controller.posts[12].value,
                                index: 12,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Post2(
                                number: '05',
                                postModel: controller.posts[13].value,
                                index: 13,
                              ),
                              Post2(
                                number: '06',
                                postModel: controller.posts[14].value,
                                index: 14,
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
