import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets.dart';

class CodeBlock extends StatelessWidget {
  final Widget child;
  final String text;

  const CodeBlock({Key key, this.text, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Container(
          margin: const EdgeInsets.only(top: 5, right: 5),
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: text));
              final Widget toastWidget = Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xff006EDF), width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        4,
                      ),
                    ),
                    color: const Color(0xff007FFF),
                  ),
                  width: 150,
                  height: 40,
                  child: const Center(
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        'Copy successful',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
              ToastWidget().showToast(context, toastWidget, 500);
            },
            icon: const Icon(
              Icons.content_copy,
              size: 10,
            ),
          ),
        )
      ],
    );
  }
}
