import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:wizard/constants.dart';

class CustomProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(200.0),
      child: Center(
        child: LoadingIndicator(
          indicatorType: Indicator.values[randomIndicator],
          color: randomColors,
          colors: [
            randomColors,
            randomColors,
            randomColors,
            randomColors,
          ],
        ),
      ),
    );
  }
}
