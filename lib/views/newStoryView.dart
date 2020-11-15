import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:mime_type/mime_type.dart';
import 'package:wizard/controllers/controllers.dart';
import 'package:wizard/widgets/widgets.dart';
import '../constants.dart';

class NewStoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  DropzoneView(
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
                      if (mime(ev.name as String) ==
                          mimeMD) /*change if possible*/ {
                        final List rr = await NewStoryController.to.controller
                            .getFileData(ev);
                        final List<int> rs = List.from(rr);
                        NewStoryController.to.fileData.assignAll(rs);
                        NewStoryController.to.fileName.value =
                            ev.name as String;
                        final df = utf8.decode(
                          await NewStoryController.to.controller
                              .getFileData(ev),
                        );
                        NewStoryController.to.preview.value = true;
                        NewStoryController.to.previewMe.value = false;

                        NewStoryController.to.title.value = df
                            .substring(
                                df.indexOf('#') + 1, df.indexOf("\n") - 1)
                            .trim();
                      } else {
                        Get.snackbar('invalid', '',
                            titleText: const Text('Invalid'));
                        print('Invalid file');
                      }
                    },
                  ),
                  Container(
                    color: const Color(0xff4ba97d),
                    width: double.maxFinite,
                    height: 70,
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Drop markdown files here or click to',
                          style: const TextStyle(
                              fontSize: 15,
                              fontFamily: "Helvetica Neue",
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  final res =
                                      await FilePicker.platform.pickFiles(
                                    withData: true,
                                    allowedExtensions: ['md'],
                                    type: FileType.custom,
                                  );
                                  NewStoryController.to.fileData
                                      .assignAll(res.files[0].bytes);
                                  NewStoryController.to.fileName.value =
                                      res.files[0].name;
                                  final df = utf8
                                      .decode(NewStoryController.to.fileData);
                                  NewStoryController.to.title.value = df
                                      .substring(df.indexOf('#') + 1,
                                          df.indexOf("\n") - 1)
                                      .trim();
                                  NewStoryController.to.preview.value = true;
                                  NewStoryController.to.previewMe.value = false;
                                },
                              text: ' upload ',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black45,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(
                              text: 'markdown file',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: "Helvetica Neue",
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Obx(
              () => Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (NewStoryController.to.preview.value)
                      if (NewStoryController.to.previewMe.value)
                        Expanded(
                          child: SizedBox(
                            child: MarkdownWidget(
                              data: utf8.decode(NewStoryController.to.fileData),
                            ),
                          ),
                        )
                      else
                        Center(
                          child: InkWell(
                            onTap: () =>
                                NewStoryController.to.previewMe.value = true,
                            child: const Text(
                              'Preview Me',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Helvetica Neue",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                    else
                      const Text(
                        'Preview will be shown here',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Helvetica Neue",
                            fontWeight: FontWeight.w400),
                      ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Name: ${NewStoryController.to.fileName.value}',
                            textScaleFactor: 1.2,
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "Helvetica Neue",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: RaisedButton(
                            onPressed: () => NewStoryController.to.upload(),
                            color: const Color(0xff4ba97d),
                            child: const Text(
                              'Publish as Story',
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                  // fontSize: 2,
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: "Lucida Sans"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // child: NewStoryController.to.preview.value
                //     ? MarkdownWidget(
                //         data: utf8.decode(NewStoryController.to.fileData),
                //       )
                //     : const Center(
                //         child: Text('Preview will be show here'),
                //       ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Stack(
//   alignment: Alignment.center,
//   children: [
//     Align(
//       child: Container(
//         width: 900,
//         height: 400,
//         margin: const EdgeInsets.all(35),
//         padding: const EdgeInsets.all(15),
//         child: Builder(
//           builder: (_) => DropzoneView(
//             operation: DragOperation.copy,
//             cursor: CursorType.move,
//             onCreated: (ctrl) {
//               NewStoryController.to.controller = ctrl;
//             },
//             onLoaded: () => print('Zone 1 loaded'),
//             onError: (ev) => print('Zone 1 error: $ev'),
//             onHover: () {
//               // print('Zone 1 hovered');
//             },
//             onLeave: () {
//               print('Zone 1 left');
//             },
//             onDrop: (ev) async {
//               if (mime(ev.name as String) ==
//                   mimeMD) /*change if possible*/ {
//                 final List rr = await NewStoryController.to.controller
//                     .getFileData(ev);
//                 final List<int> rs = List.from(rr);
//                 NewStoryController.to.fileData.assignAll(rs);
//                 NewStoryController.to.fileName.value =
//                     ev.name as String;
//                 final df = utf8.decode(
//                   await NewStoryController.to.controller
//                       .getFileData(ev),
//                 );
//                 NewStoryController.to.title.value = df
//                     .substring(
//                         df.indexOf('#') + 1, df.indexOf("\n") - 1)
//                     .trim();
//                 NewStoryController.to.indexValue.value = 1;
//               } else {
//                 Get.snackbar('invalid', '',
//                     titleText: const Text('Invalid'));
//                 print('Invalid file');
//               }
//             },
//           ),
//         ),
//       ),
//     ),
//     Obx(
//       () => IndexedStack(
//         index: NewStoryController.to.indexValue.value,
//         children: [
//           Align(
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(width: 3.0, color: randomColors),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(15.0),
//                 ),
//                 color: Colors.redAccent,
//               ),
//               margin: const EdgeInsets.all(35),
//               padding: const EdgeInsets.all(15),
//               width: 900,
//               height: 400,
//               child: InkWell(
//                 onTap: () async {
//                   final res = await FilePicker.platform.pickFiles(
//                     withData: true,
//                     allowedExtensions: ['md'],
//                     type: FileType.custom,
//                   );
//                   NewStoryController.to.fileData
//                       .assignAll(res.files[0].bytes);
//                   NewStoryController.to.fileName.value =
//                       res.files[0].name;
//                 },
//               ),
//             ),
//           ),
//           Align(
//             child: SizedBox(
//               width: 900,
//               height: 400,
//               child: MarkdownWidget(
//                 data: utf8.decode(NewStoryController.to.fileData),
//                 loadingWidget: const Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//     Align(
//       alignment: Alignment.topRight,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 0),
//             child: RaisedButton(
//               onPressed: () =>
//                   NewStoryController.to.indexValue.value = 0,
//               color: const Color(0xff4ba97d),
//               child: const Text(
//                 'Reset',
//                 textScaleFactor: 1.1,
//                 style: TextStyle(
//                     // fontSize: 2,
//                     color: Colors.white,
//                     fontFamily: "Lucida Sans"),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 00),
//             child: RaisedButton(
//               onPressed: () => NewStoryController.to.upload(),
//               color: const Color(0xff4ba97d),
//               child: const Text(
//                 'Publish as Story',
//                 textScaleFactor: 1.1,
//                 style: TextStyle(
//                     // fontSize: 2,
//                     color: Colors.white,
//                     fontFamily: "Lucida Sans"),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//     Container(
//       color: const Color(0xff4ba97d),
//       width: 400,
//       height: 50,
//       child: const Padding(
//         padding: EdgeInsets.all(12.0),
//         child: Text(
//           'Drop markdown files here or click to upload markdown files',
//           style: TextStyle(
//               fontSize: 18,
//               fontFamily: "Helvetica Neue",
//               fontWeight: FontWeight.w400),
//         ),
//       ),
//     ),
//     const Positioned(
//       bottom: 1,
//       child: Text(
//         "(Don't drop more than one files)",
//         style: TextStyle(
//             fontSize: 14,
//             fontFamily: "Helvetica Neue",
//             fontWeight: FontWeight.w400),
//       ),
//     ),
//     Positioned(
//       bottom: -25,
//       child: Card(
//         shadowColor: const Color(0xff4ba97d),
//         margin: const EdgeInsets.only(bottom: 90),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Obx(
//             () => Text(
//               'Name: ${NewStoryController.to.fileName.value + NewStoryController.to.indexValue.value.toString()}',
//               textScaleFactor: 1.2,
//               style: const TextStyle(
//                   fontSize: 18,
//                   fontFamily: "Helvetica Neue",
//                   fontWeight: FontWeight.w400),
//             ),
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
