import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:mime_type/mime_type.dart';
import 'package:wizard/constants.dart';
import 'controllers/controllers.dart';
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
      home: NewStoryView(),
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

class NewStoryView extends StatelessWidget {
  final c = Get.put(NewStoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Builder(
                  builder: (context) => DropzoneView(
                    operation: DragOperation.linkMove,
                    cursor: CursorType.grab,
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
                      print('Zone 1 drop: ${ev.runtimeType}');
                      print('Zone 1 drop: ${mime(ev.name as String)}');
                      print(ascii.decode(await NewStoryController.to.controller
                          .getFileData(ev)));
                    },
                  ),
                ),
                const Text('Drop markdown file only')
              ],
            ),
          )
        ],
      ),
    );
  }
}
