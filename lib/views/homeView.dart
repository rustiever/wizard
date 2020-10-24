import 'package:flutter/material.dart';
import 'package:wizard/services/firebaseServices.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          titleSpacing: 70,
          title: const Text(
            'Wizard',
            style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                letterSpacing: 2,
                fontFamily: "Helvetica Neue"),
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.search_sharp,
                  color: Color(0xff757575),
                  size: 30.0,
                ),
                padding: const EdgeInsets.all(15.0),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.bookmark_outline_rounded,
                  color: Color(0xff757575),
                  size: 30.0,
                ),
                padding: const EdgeInsets.all(15.0),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.notifications_on_outlined,
                  color: Color(0xff757575),
                  size: 30.0,
                ),
                padding: const EdgeInsets.all(15.0),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.person_outline_rounded,
                  color: Color(0xff757575),
                  size: 30.0,
                ),
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 80.0, 15.0),
                onPressed: () {}),
          ],
        ),
        body: ListView(
          children: [
            Row(
              children: [
                const Post1(),
                // Container(
                //   width: 600,
                //   height: 400,
                //   color: Colors.green,
                // ),
              ],
            ),
            Center(
              child: RaisedButton(
                onPressed: () async {
                  await FirebaseService().signOut();
                },
                child: const Text('sign out'),
              ),
            ),
          ],
        ));
  }
}

class Post1 extends StatelessWidget {
  final String postImage,
      authorName,
      authorImage,
      title,
      content,
      readTime,
      community;

  const Post1(
      {Key key,
      this.postImage =
          'https://images.unsplash.com/photo-1555212697-194d092e3b8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      this.authorName = 'Sharan',
      this.authorImage =
          'https://images.unsplash.com/photo-1504593811423-6dd665756598?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      this.title = 'title of this title of this title',
      this.content =
          'Before getting started, the documentation assumes you are able to create (or have an existing) Flutter project and also have an active Firebase project. If you do not meet these prerequisites, follow the links below',
      this.readTime = '5',
      this.community = 'Flutter Community'})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.network(
        //   postImage,
        //   // height: 450,
        //   // width: 350,

        //   // fit: ,
        // ),
        Container(
          height: 280,
          width: 350,
          // color: Colors.purpleAccent,
          child: Image.network(
            postImage,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
