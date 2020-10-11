import 'package:flutter/material.dart';

class IntroPageFlatButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const IntroPageFlatButton({
    Key key,
    this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontFamily: "Lucida Sans",
            fontSize: 16,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
