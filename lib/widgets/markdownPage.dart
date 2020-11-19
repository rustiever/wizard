import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:wizard/controllers/controllers.dart';

class MarkdownPage extends GetView<PostController> {
  const MarkdownPage({
    Key key,
    this.data,
  }) : super(key: key);
  final List<int> data;
  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: utf8.decode(data),
      imageBuilder: (uri, title, alt) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Center(
          child: Column(
            children: [
              Image.network(
                uri.toString(),
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => Text(
                  error.toString() + alt,
                ),
              ),
            ],
          ),
        ),
      ),
      selectable: true,
      onTapLink: (text, href, title) => controller.launchURL(href),
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      styleSheet: MarkdownStyleSheet(
        h1Align: WrapAlignment.center,
        code: const TextStyle(
            fontFamily: "Monaco", fontSize: 16, fontWeight: FontWeight.w400),
        h1: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 48,
            fontWeight: FontWeight.w400),
        h2: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 36,
            fontWeight: FontWeight.w400),
        h3: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 24,
            fontWeight: FontWeight.w400),
        p: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 21,
            fontWeight: FontWeight.w400),
        horizontalRuleDecoration: BoxDecoration(color: Colors.blueGrey[200]),
        blockSpacing: 5,
        codeblockPadding: const EdgeInsets.all(8),
        strong: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 21,
            fontWeight: FontWeight.w700),
        listIndent: 50,
        blockquote: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 21,
            fontWeight: FontWeight.w400),
        checkbox: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 21,
            fontWeight: FontWeight.w400),
        del: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 21,
            fontWeight: FontWeight.w400),
        em: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 21,
            fontWeight: FontWeight.w400),
        a: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 21,
            fontWeight: FontWeight.w400),
        listBullet: const TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 21,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
