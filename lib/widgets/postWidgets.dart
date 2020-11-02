import 'dart:math';

import 'package:flutter/material.dart';

class Post1 extends StatelessWidget {
  final String postImage,
      authorName,
      authorImage,
      title,
      content,
      readTime,
      community;

  final void Function() onTap;

  const Post1(
      {Key key,
      this.postImage =
          'https://images.unsplash.com/photo-1555212697-194d092e3b8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      this.authorName = 'Sharan',
      this.authorImage =
          'https://images.unsplash.com/photo-1504593811423-6dd665756598?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      this.title = 'Title of this title of this title',
      this.content =
          'In this article, we will draw a curved dashed in Flutter.',
      this.readTime = '5',
      this.community = 'Flutter Community',
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: Mai,
          children: [
            GestureDetector(
              onTap: onTap,
              child: SizedBox(
                height: 260,
                width: 360,
                child: Image.network(
                  postImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(authorImage),
                  radius: 12.0,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(authorName)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                title,
                style: const TextStyle(
                    fontFamily: "Helvetica Neue",
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                content,
                style: const TextStyle(
                    fontFamily: "Times New Roman",
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    'Read More . $readTime min read ',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: "Helvetica Neue",
                        fontSize: 13),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.star_rate,
                    size: 13,
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Post2 extends StatelessWidget {
  final String postImage,
      authorName,
      authorImage,
      title,
      content,
      readTime,
      community,
      number,
      date;
  final void Function() onTap;
  const Post2(
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
      this.community = 'Flutter Community',
      this.onTap,
      this.number,
      this.date = "Sep 30"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (number != null)
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xffe6e6e6),
              child: Text(
                number,
                textScaleFactor: 2,
              ),
            )
          else
            const SizedBox.shrink(),
          if (number != null)
            const SizedBox(
              width: 30,
            )
          else
            const SizedBox.shrink(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(authorImage),
                    radius: 12.0,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: authorName,
                          style: const TextStyle(
                              fontFamily: "Helvetica Neue",
                              color: Colors.black),
                        ),
                        const TextSpan(
                          text: ' in ',
                          style: TextStyle(
                              fontFamily: "Helvetica Neue", color: Colors.grey),
                        ),
                        TextSpan(
                          text: community,
                          style: const TextStyle(
                              fontFamily: "Helvetica Neue",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: onTap,
                child: SizedBox(
                  width: 230,
                  child: Text(
                    title + title,
                    style: const TextStyle(
                        fontFamily: "Helvetica Neue",
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    Text(
                      '$date . $readTime min read',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: "Helvetica Neue",
                          fontSize: 13),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    if (Random().nextBool())
                      const Icon(
                        Icons.star_rate,
                        size: 13,
                        color: Colors.grey,
                      )
                    else
                      const SizedBox.shrink()
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 130,
            height: 100,
            child: Image.network(
              postImage,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class Post3 extends StatelessWidget {
  final String postImage,
      authorName,
      authorImage,
      title,
      content,
      readTime,
      community,
      number,
      date;
  final void Function() onTap;
  const Post3(
      {Key key,
      this.postImage =
          'https://images.unsplash.com/photo-1555212697-194d092e3b8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      this.authorName = 'Sharan',
      this.authorImage =
          'https://images.unsplash.com/photo-1504593811423-6dd665756598?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      this.title = 'title of this title of this title',
      this.content =
          'Before  (or have an existing) Flutter project and  If you do not meet these prerequisites, follow the links below',
      this.readTime = '5',
      this.community = 'Flutter Community',
      this.onTap,
      this.number,
      this.date = "Sep 30"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(authorImage),
                  radius: 12.0,
                ),
                const SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: authorName,
                        style: const TextStyle(
                            fontFamily: "Helvetica Neue", color: Colors.black),
                      ),
                      const TextSpan(
                        text: ' in ',
                        style: TextStyle(
                            fontFamily: "Helvetica Neue", color: Colors.grey),
                      ),
                      TextSpan(
                        text: community,
                        style: const TextStyle(
                            fontFamily: "Helvetica Neue", color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: onTap,
              child: SizedBox(
                width: 500,
                child: Text(
                  title + title,
                  style: const TextStyle(
                      fontFamily: "Helvetica Neue",
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: onTap,
              child: SizedBox(
                width: 500,
                child: Text(
                  content,
                  style: const TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    '$date . $readTime min read',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: "Helvetica Neue",
                        fontSize: 13),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  if (Random().nextBool())
                    const Icon(
                      Icons.star_rate,
                      size: 13,
                      color: Colors.grey,
                    )
                  else
                    const SizedBox.shrink(),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz_rounded),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 200,
          height: 160,
          child: Image.network(
            postImage,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
