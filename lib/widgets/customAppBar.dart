import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizard/routes.dart';
import 'package:wizard/services/firebaseServices.dart';
import 'package:wizard/views/views.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
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
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      titleSpacing: 70,
      title: GestureDetector(
        onTap: () => Get.offAllNamed(homeRoute),
        child: const Text(
          'Wizard',
          textScaleFactor: 2,
          style: TextStyle(
              color: Colors.black,
              // fontSize: 3,
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
            onPressed: () {}),
        IconButton(
            icon: const Icon(
              Icons.bookmark_outline_rounded,
              color: Color(0xff757575),
              size: 25.0,
            ),
            padding: const EdgeInsets.all(15.0),
            onPressed: () {}),
        IconButton(
            icon: const Icon(
              Icons.notifications_on_outlined,
              color: Color(0xff757575),
              size: 25.0,
            ),
            padding: const EdgeInsets.all(15.0),
            onPressed: () {}),
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
              } else if (value == profileMenu[10]) {
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
              backgroundColor: Colors.white,
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
