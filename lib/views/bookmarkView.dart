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
              if (controller.bookPosts.isNullOrBlank) {
                return CustomProgressIndicator();
              }
              print(controller.bookPosts.length);
              return ListView.builder(
                itemCount: controller.bookPosts.length,
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
