import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:wizard/widgets/widgets.dart';

import '../constants.dart';

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                const Text(
                  "Flutter Forms Validation — the Ultimate Guide",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 48,
                      fontWeight: FontWeight.w400),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(authorImage),
                  ),
                  title: Text(
                    authorName,
                    style: const TextStyle(
                        fontFamily: "Helvetica Neue",
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text('$date . $readTime min read'),
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
                SizedBox(
                  height: 6900,
                  child: FutureBuilder<String>(
                      future: rootBundle.loadString('assets/README.md'),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.hasError) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return MarkdownWidget(data: snapshot.data);
                      }),
                ),
                SizedBox(
                  height: 9800,
                  child: FutureBuilder<String>(
                    future: rootBundle.loadString('assets/README.md'),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.hasError) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Column(
                        children:
                            MarkdownGenerator(data: snapshot.data).widgets,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
