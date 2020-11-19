import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizard/models/models.dart';
import 'package:wizard/widgets/widgets.dart';

class PostView extends StatelessWidget {
  final postModel = Get.arguments as PostModel;
  @override
  Widget build(BuildContext context) {
    // print(postModel.postUid);
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                    // children: [
                    //   RaisedButton(
                    //     onPressed: () => Get.back(result: homeRoute),
                    //   )
                    // ],
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
          Container(
            height: 300,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            'Learn more.',
                            style: TextStyle(
                                fontFamily: "Helvetica Neue",
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          isThreeLine: true,
                          subtitle: RichText(
                            text: TextSpan(
                              text:
                                  'Wizard is an open platform where 170 million readers come to find insightful and dynamic thinking. Here, expert and undiscovered voices alike dive into the heart of any topic and bring new ideas to the surface. ',
                              style: TextStyle(
                                fontFamily: "Helvetica Neue",
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Learn more',
                                  style: TextStyle(
                                      fontFamily: "Helvetica Neue",
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            'Make Wizard yours.',
                            style: TextStyle(
                                fontFamily: "Helvetica Neue",
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          isThreeLine: true,
                          subtitle: RichText(
                            text: TextSpan(
                              text:
                                  'Follow the writers, publications, and topics that matter to you, and you’ll see them on your homepage and in your inbox. ',
                              style: TextStyle(
                                fontFamily: "Helvetica Neue",
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Explore',
                                  style: TextStyle(
                                      fontFamily: "Helvetica Neue",
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            'Share your thinking.',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Helvetica Neue",
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          isThreeLine: true,
                          subtitle: RichText(
                            text: TextSpan(
                              text:
                                  'If you have a story to tell, knowledge to share, or a perspective to offer — welcome home. It’s easy and free to post your thinking on any topic. ',
                              style: TextStyle(
                                fontFamily: "Helvetica Neue",
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Write on Wizard',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontFamily: "Helvetica Neue",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    child: Row(
                      children: [
                        const Text(
                          'Wizard',
                          textScaleFactor: 2,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: -1,
                              fontFamily: "Helvetica Neue"),
                        ),
                        const Spacer(),
                        SizedBox(
                          child: Row(
                            children: [
                              FlatButton(
                                onPressed: () {},
                                child: const Text(
                                  'About',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontFamily: "Helvetica Neue"),
                                ),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: const Text(
                                  'Help',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontFamily: "Helvetica Neue"),
                                ),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: const Text(
                                  'Legal',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontFamily: "Helvetica Neue"),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
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
