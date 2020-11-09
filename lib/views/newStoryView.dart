import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:mime_type/mime_type.dart';
import 'package:wizard/controllers/controllers.dart';
import 'package:wizard/widgets/widgets.dart';

import '../constants.dart';

class NewStoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            child: Container(
              width: 900,
              height: 400,
              margin: const EdgeInsets.all(35),
              padding: const EdgeInsets.all(15),
              child: Builder(
                builder: (_) => DropzoneView(
                  operation: DragOperation.copy,
                  cursor: CursorType.move,
                  onCreated: (ctrl) {
                    NewStoryController.to.controller = ctrl;
                  },
                  onLoaded: () => print('Zone 1 loaded'),
                  onError: (ev) => print('Zone 1 error: $ev'),
                  onHover: () {
                    // print('Zone 1 hovered');
                  },
                  onLeave: () {
                    print('Zone 1 left');
                  },
                  onDrop: (ev) async {
                    if (mime(ev.name as String) == mimeMD) {
                      // change if possible
                      NewStoryController.to.fileData.value =
                          await NewStoryController.to.controller
                              .getFileData(ev);
                      NewStoryController.to.fileName.value = ev.name as String;
                      print(await NewStoryController.to.controller
                          .getFilename(ev));
                      print(NewStoryController.to.fileName.value);
                    } else {
                      Get.snackbar('invalid', '',
                          titleText: const Text('Invalid'));
                      print('no file');
                    }
                  },
                ),
              ),
            ),
          ),
          Align(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3.0, color: randomColors),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
                color: Colors.redAccent,
              ),
              margin: const EdgeInsets.all(35),
              padding: const EdgeInsets.all(15),
              width: 900,
              height: 400,
              child: InkWell(
                onTap: () async {
                  final res = await FilePicker.platform.pickFiles(
                    withData: true,
                    allowedExtensions: ['md'],
                    type: FileType.custom,
                  );
                  NewStoryController.to.fileData.value = res.files[0].bytes;
                  NewStoryController.to.fileName.value = res.files[0].name;
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 100),
              child: RaisedButton(
                onPressed: () => NewStoryController.to.upload(),
                color: const Color(0xff4ba97d),
                child: const Text(
                  'Publish as Story',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                      // fontSize: 2,
                      color: Colors.white,
                      fontFamily: "Lucida Sans"),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Please give title as fileName(even if it is too long, for space use underscore)',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                  fontFamily: "Helvetica Neue",
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            color: const Color(0xff4ba97d),
            width: 400,
            height: 50,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Drop markdown files here or click to upload markdown files',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Helvetica Neue",
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const Positioned(
            bottom: 1,
            child: Text(
              "(Don't drop more than one files)",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Helvetica Neue",
                  fontWeight: FontWeight.w400),
            ),
          ),
          Positioned(
            bottom: -25,
            child: Card(
              shadowColor: const Color(0xff4ba97d),
              margin: const EdgeInsets.only(bottom: 90),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Text(
                    'Name: ${NewStoryController.to.fileName.value}',
                    textScaleFactor: 1.2,
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Helvetica Neue",
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
