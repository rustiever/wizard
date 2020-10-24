import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets.dart';

class GetStartedButton extends StatelessWidget {
  final String title;
  const GetStartedButton({
    Key key,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.all(18.0),
      onPressed: () {
        Get.dialog(
          AuthWidget(),
        );
      },
      color: const Color(0xff4ba97d),
      child: const Text(
        'Get Started',
        style: TextStyle(
            color: Colors.white, fontSize: 24.0, fontFamily: "Lucida Sans"),
      ),
    );
  }
}
