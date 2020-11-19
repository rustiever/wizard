import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:wizard/constants.dart';

class CustomProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingIndicator(
        indicatorType:
            Indicator.values[Random().nextInt(Indicator.values.length)],
        color: randomColors,
        colors: [
          randomColors,
          randomColors,
          randomColors,
          randomColors,
        ],
      ),
    );
  }
}
