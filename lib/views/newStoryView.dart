import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:wizard/controllers/newStoryController.dart';
import 'package:wizard/widgets/widgets.dart';

class NewStoryView extends StatelessWidget {
  final c = Get.put(NewStoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: Builder(
              builder: (context) => DropzoneView(
                operation: DragOperation.copy,
                mime: const ['md'],
                cursor: CursorType.grab,
                onCreated: (ctrl) => NewStoryController.to.controller = ctrl,
                onLoaded: () => print('Zone 1 loaded'),
                onError: (ev) => print('Zone 1 error: $ev'),
                onHover: () {
                  // print('Zone 1 hovered');
                },
                onLeave: () {
                  print('Zone 1 left');
                },
                onDrop: (ev) {
                  print('Zone 1 drop: ${ev.runtimeType}');
                  print('Zone 1 drop: ${ev.name}');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
