import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizard/models/models.dart';
import 'package:wizard/routes.dart';
import 'package:wizard/widgets/widgets.dart';

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postModel = Get.arguments as PostModel;
    return Scaffold(
      appBar: CustomAppBar(),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                RaisedButton(
                  onPressed: () => Get.back(result: homeRoute),
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: MarkdownPage(data: postModel.data),
          ),
          Expanded(
            child: Column(),
          ),
        ],
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
