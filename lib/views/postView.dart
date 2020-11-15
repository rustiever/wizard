import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:wizard/controllers/postController.dart';
import 'package:wizard/models/postModel.dart';
import 'package:wizard/widgets/widgets.dart';

class PostView extends StatelessWidget {
  final PostModel postModel;

  PostView({Key key, @required this.postModel}) : super(key: key);

  final PostController controller = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    // final List<Widget> post = MarkdownGenerator(
    //   styleConfig: StyleConfig(),
    //   data: utf8.decode(
    //     postModel.data,
    //   ),
    // ).widgets;
    // post.removeAt(1);

//     return Scaffold(
//       appBar: CustomAppBar(),
//       body: Center(
//         child: SizedBox(
//           width: 850,
//           child: Padding(
//             padding: const EdgeInsets.only(
//               top: 40.0,
//             ),
//             child: ListView(
//               children: [

//                 SizedBox(
//                   height: 700,
//                   // child: ListView(
//                   //   shrinkWrap: true,
//                   //   children: post,
//                   // ),
//                   child: FutureBuilder<String>(
//                     future: rootBundle.loadString('assets/Lorem_Ipsum.md'),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData || snapshot.hasError) {
//                         return const Center(child: CircularProgressIndicator());
//                       }
//                       const pinkAccent = Colors.pinkAccent;
//                       return Center(
//                         child: MarkdownWidget(
//                             controller: controller.tocController,
//                             data: snapshot.data,
//                             styleConfig: StyleConfig(
//                               pConfig: PConfig(
//                                   linkGesture: (linkChild, url) {
//                                     return GestureDetector(
//                                       onTap: () => controller.launchURL(url),
//                                       child: linkChild,
//                                     );
//                                   },
//                                   selectable: false),
//                               preConfig: PreConfig(
//                                   preWrapper: (child, text) => CodeBlock(
//                                         text: text,
//                                         child: child,
//                                       )),
//                               tableConfig: TableConfig(
//                                 defaultColumnWidth: const FixedColumnWidth(50),
//                                 headChildWrapper: (child) => Container(
//                                   margin: const EdgeInsets.all(10.0),
//                                   alignment: Alignment.center,
//                                   child: child,
//                                 ),
//                                 bodyChildWrapper: (child) => Container(
//                                   margin: const EdgeInsets.all(10.0),
//                                   alignment: Alignment.center,
//                                   child: child,
//                                 ),
//                               ),
//                               titleConfig: TitleConfig(
//                                 commonStyle: const TextStyle(
//                                   fontFamily: "Times New Roman",
//                                   fontSize: 21
//                                 ),
//                                 divider: const Divider(),
//                                 h1: const TextStyle(
//                                     fontSize: 48,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               hrConfig: HrConfig(color: pinkAccent,height: 10),
//                               olConfig: OlConfig(textStyle: const TextStyle(
// fontWeight: FontWeight.bold
//                               ),)
//                             ),
//                             widgetConfig: WidgetConfig(),),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
    return Scaffold(
      appBar: CustomAppBar(),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(),
          ),
          Expanded(
            flex: 6,
            child: MarkdownPage(postModel: postModel),
          ),
        ],
      ),
    );
  }
}

class MarkdownPage extends StatelessWidget {
  const MarkdownPage({
    Key key,
    @required this.postModel,
  }) : super(key: key);

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: utf8.decode(postModel.data),
      styleSheet: MarkdownStyleSheet(
        p: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 21,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

// class MarkdownPage extends StatelessWidget {
//   const MarkdownPage({
//     Key key,
//     @required this.controller,
//     @required this.postModel,
//   }) : super(key: key);

//   final PostController controller;
//   final PostModel postModel;

//   @override
//   Widget build(BuildContext context) {
//     return MarkdownWidget(
//       controller: controller.tocController,
//       data: utf8.decode(postModel.data),
//       // widgetConfig: WidgetConfig(
//       //   p: (node) => Text(
//       //     node.textContent,
//       //     style: const TextStyle(
//       //         fontFamily: "Times New Roman",
//       //         fontSize: 21,
//       //         fontWeight: FontWeight.w400),
//       //   ),
//       //   pre: (node) => Text(node.textContent),
//       //   ol: (node) => Text(node.textContent),
//       //   ul: (node) => Text(node.textContent),
//       //   table: (node) => Text(node.textContent),
//       //   block: (node) => Text(node.textContent),
//       //   hr: (node) => Text(node.textContent),
//       // ),
//       styleConfig: StyleConfig(
//         codeConfig: CodeConfig(
//           codeStyle: const TextStyle(
//               fontFamily: "Times New Roman",
//               fontSize: 21,
//               fontWeight: FontWeight.w400),
//         ),
//         hrConfig: HrConfig(),
//         pConfig: PConfig(
//             onLinkTap: (url) => controller.launchURL(url),
//             // linkGesture: (linkChild, url) {
//             //   return GestureDetector(
//             //     onTap: () => controller.launchURL(url),
//             //     child: linkChild,
//             //   );
//             // },
//             selectable: false),
//         preConfig: PreConfig(
//           autoDetectionLanguage: true,
//           preWrapper: (child, text) {
//             return CodeBlock(
//               text: text,
//               child: child,
//             );
//           },
//         ),
//         tableConfig: TableConfig(
//           defaultColumnWidth: const FixedColumnWidth(50),
//           headChildWrapper: (child) => Container(
//             margin: const EdgeInsets.all(10.0),
//             alignment: Alignment.center,
//             child: child,
//           ),
//           bodyChildWrapper: (child) => Container(
//             margin: const EdgeInsets.all(10.0),
//             alignment: Alignment.center,
//             child: child,
//           ),
//         ),
//         blockQuoteConfig: BlockQuoteConfig(),
//         titleConfig: TitleConfig(
//           showDivider: false,
//           commonStyle: const TextStyle(
//             fontFamily: "Times New Roman",
//           ),
//           h6: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
//           divider: const Divider(),
//           h1: const TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
//         ),
//         olConfig: OlConfig(
//           // indexWidget: (deep, index) {
//           //   return Text(deep.toString() + index.toString());
//           // },
//           // olWrapper: (child) => Container(
//           //   color: Colors.lightBlue,
//           //   child: child,
//           // ),
//           textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
//         ),
//         ulConfig: UlConfig(
//           textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 21),
//         ),
//       ),
//     );
//   }
// }

// Text(
//   // "Flutter Forms Validation — the Ultimate Guide",
//   postModel.title,
//   style: const TextStyle(
//       fontFamily: "Times New Roman",
//       fontSize: 48,
//       fontWeight: FontWeight.w400),
// ),
// ListTile(
//   leading: CircleAvatar(
//     radius: 30,
//     backgroundImage: NetworkImage(postModel.authorImage),
//   ),
//   title: Text(
//     postModel.authorName,
//     style: const TextStyle(
//         fontFamily: "Helvetica Neue",
//         fontSize: 14,
//         fontWeight: FontWeight.w400),
//   ),
//   subtitle: Text(
//       '${postModel.date} . ${postModel.finishTime} min read'),
//   trailing: Wrap(
//     children: [
//       IconButton(
//         icon: const Icon(Icons.bookmark_border_rounded),
//         onPressed: () {},
//       ),
//       IconButton(
//         icon: const Icon(Icons.more_horiz_rounded),
//         onPressed: () {},
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: 600,
//   child: MarkdownWidget(
//     data: utf8.decode(postModel.data),
//     loadingWidget: const Center(
//       child: CircularProgressIndicator(),
//     ),
//   ),
// ),
