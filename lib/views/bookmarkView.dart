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
        child: Column(
          children: [
            Container(
              child: Center(
                child: Obx(
                  () => Text(controller.user.value.bookmarks.length.toString()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
