import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.all(18.0),
      onPressed: () {},
      color: const Color(0xff4ba97d),
      child: const Text(
        'Get Started',
        style: TextStyle(
            color: Colors.white, fontSize: 24.0, fontFamily: "Lucida Sans"),
      ),
    );
  }
}
