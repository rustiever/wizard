import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_page/search_page.dart';
import 'package:wizard/controllers/controllers.dart';
import 'package:wizard/models/models.dart';
import 'package:wizard/routes.dart';
import 'package:wizard/services/firebaseServices.dart';
import 'package:wizard/views/views.dart';
import '../constants.dart';
import 'widgets.dart';

class CustomAppBar extends GetView<HomeController> with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({
    Key key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: const Color(0xff00fa9a),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Get.back(),
        color: const Color(0xff757575),
      ),
      titleSpacing: 70,
      title: GestureDetector(
        onTap: () => Get.offAllNamed(homeRoute),
        child: const Text(
          'Wizard',
          textScaleFactor: 2,
          style: TextStyle(
              color: Colors.black,
              letterSpacing: -1,
              fontFamily: "Helvetica Neue"),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search_sharp,
            color: Color(0xff757575),
            size: 25.0,
          ),
          padding: const EdgeInsets.all(15.0),
          onPressed: () => showSearch(
            context: context,
            delegate: SearchPage<Rx<PostModel>>(
                barTheme: ThemeData(
                  backgroundColor: const Color(0xff00fa9a),
                ),
                searchLabel: 'Search Posts',
                suggestion: const Center(
                  child: Text('Filter Posts by name, date or claps'),
                ),
                builder: (t) => Post3(
                      postModel: t.value,
                    ),
                filter: (t) => [
                      t.value.authorName,
                      t.value.date,
                      t.value.title,
                      t.value.finishTime.toString(),
                      t.value.claps.toString()
                    ],
                items: controller.totalPosts),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.bookmark_outline_rounded,
            color: Color(0xff757575),
            size: 25.0,
          ),
          padding: const EdgeInsets.all(15.0),
          onPressed: () {
            Get.toNamed(bookRoute);
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_on_outlined,
            color: Color(0xff757575),
            size: 25.0,
          ),
          padding: const EdgeInsets.all(15.0),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(right: 90),
          child: PopupMenuButton(
            offset: const Offset(90, 130),
            itemBuilder: (_) => profileMenu
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Helvetica Neue"),
                    child: Text(
                      e,
                    ),
                  ),
                )
                .toList(),
            onSelected: (String value) async {
              if (value == profileMenu[0]) {
                Get.toNamed('/${profileMenu[0]}');
              } else if (value == profileMenu[profileMenu.length - 2]) {
                // Get.offAll(IntroView());
                Get.toNamed('/${profileMenu[profileMenu.length - 2]}');
              } else if (value == profileMenu[profileMenu.length - 1]) {
                Get.offAll(IntroView());
                await FirebaseService.instance.signOut();
              }
            },
            padding: const EdgeInsets.fromLTRB(
              10.0,
              10.0,
              50.0,
              10.0,
            ),
            child: const CircleAvatar(
              backgroundColor: Color(0xff00fa9a),
              child: Icon(
                Icons.person_outline_rounded,
                color: Color(0xff757575),
                size: 25.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
