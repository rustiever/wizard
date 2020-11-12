import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:wizard/models/postModel.dart';
import 'package:wizard/widgets/widgets.dart';

class PostView extends StatelessWidget {
  final PostModel postModel;

  const PostView({Key key, @required this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Widget> post = MarkdownGenerator(
      data: utf8.decode(
        postModel.data,
      ),
    ).widgets;
    post.removeAt(1);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: SizedBox(
          width: 850,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40.0,
            ),
            child: ListView(
              children: [
                Text(
                  // "Flutter Forms Validation — the Ultimate Guide",
                  postModel.title,
                  style: const TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 48,
                      fontWeight: FontWeight.w400),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(postModel.authorImage),
                  ),
                  title: Text(
                    postModel.authorName,
                    style: const TextStyle(
                        fontFamily: "Helvetica Neue",
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                      '${postModel.date} . ${postModel.finishTime} min read'),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.bookmark_border_rounded),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz_rounded),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 600,
                //   child: MarkdownWidget(
                //     data: utf8.decode(postModel.data),
                //     loadingWidget: const Center(
                //       child: CircularProgressIndicator(),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 500,
                  child: ListView(
                    shrinkWrap: true,
                    children: post,
                  ),
                  // child: FutureBuilder<String>(
                  //   future: rootBundle.loadString('assets/kl.md'),
                  //   builder: (context, snapshot) {
                  //     if (!snapshot.hasData || snapshot.hasError) {
                  //       return const Center(child: CircularProgressIndicator());
                  //     }
                  //     return Column(
                  //       children: [
                  //         Center(
                  //           child: MarkdownGenerator(data: snapshot.data)
                  //               .widgets
                  //               .last,
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // ),
                ),
                // SizedBox(
                //   height: 500,
                //   child: FutureBuilder<String>(
                //     future: rootBundle.loadString('assets/kl.md'),
                //     builder: (context, snapshot) {
                //       if (!snapshot.hasData || snapshot.hasError) {
                //         return const Center(child: CircularProgressIndicator());
                //       }
                //       return Column(
                //         children: [
                //           Center(
                //             child: MarkdownGenerator(data: snapshot.data)
                //                 .widgets
                //                 .last,
                //           ),
                //         ],
                //       );
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
