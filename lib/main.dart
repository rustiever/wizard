import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:wizard/constants.dart';
import 'views/views.dart';
import 'widgets/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostView(),
    );
  }
}

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
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return Column(
                          children:
                              MarkdownGenerator(data: snapshot.data).widgets,
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  }
}
