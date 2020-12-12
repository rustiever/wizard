import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizard/controllers/controllers.dart';

import 'package:wizard/widgets/widgets.dart';

class BookmarkView extends GetView<BookMarkController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: RefreshIndicator(
        onRefresh: () => controller.refreshBooks(),
        child: Center(
          child: Obx(
            () {
              if (controller.posts.isNullOrBlank) {
                return CustomProgressIndicator();
              }
              print(controller.posts.length);
              return ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Post4(
                    index: index,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
