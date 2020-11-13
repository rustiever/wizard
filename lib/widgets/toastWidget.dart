import 'package:flutter/material.dart';

class ToastWidget {
  ToastWidget._internal();

  static ToastWidget _instance;

  // ignore: sort_unnamed_constructors_first
  factory ToastWidget() {
    // ignore: join_return_with_assignment
    _instance ??= ToastWidget._internal();
    return _instance;
  }

  bool isShowing = false;

  void showToast(BuildContext context, Widget widget, int milliseconds) {
    if (!isShowing) {
      isShowing = true;
      FullScreenDialog.getInstance().showDialog(
        context,
        widget,
      );
      Future.delayed(
        Duration(
          milliseconds: milliseconds,
        ),
        () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
            isShowing = false;
          } else {
            isShowing = false;
          }
        },
      );
    }
  }
}

class FullScreenDialog {
  static FullScreenDialog _instance;

  // ignore: prefer_constructors_over_static_methods
  static FullScreenDialog getInstance() {
    // ignore: prefer_conditional_assignment
    if (_instance == null) {
      _instance = FullScreenDialog._internal();
    }
    return _instance;
  }

  FullScreenDialog._internal();

  void showDialog(BuildContext context, Widget child) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (ctx, anm1, anm2) {
          return child;
        },
      ),
    );
  }
}
