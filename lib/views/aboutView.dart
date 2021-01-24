import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizard/widgets/widgets.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
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
          FlatButton(
            onPressed: () {},
            child: const Text('Subscribe'),
          ),
          FlatButton(
            onPressed: () {},
            child: const Text('Write'),
          ),
          FlatButton(
            onPressed: () async {
              await Get.dialog(
                AuthWidget(
                  isSignUp: false,
                ),
              );
            },
            child: const Text('Sign In'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10, 35, 10),
            child: RaisedButton(
              padding: const EdgeInsets.all(10.0),
              onPressed: () async {
                await Get.dialog(
                  AuthWidget(),
                );
              },
              color: const Color(0xff4ba97d),
              child: const Text(
                'Get Started',
                style:
                    TextStyle(color: Colors.white, fontFamily: "Lucida Sans"),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 300,
            child: Center(
              child: Text(
                'Every idea needs a Wizard',
                style: TextStyle(fontSize: 106, fontFamily: 'Georgia'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'The best ideas can change who we are. Wizard is where those ideas take shape, take off, and spark powerful conversations. We’re an open platform where 170 million readers come to find insightful and dynamic thinking. Here, expert and undiscovered voices alike dive into the heart of any topic and bring new ideas to the surface. Our purpose is to spread these ideas and deepen understanding of the world.',
                        style: TextStyle(
                            fontSize: 27,
                            fontFamily: 'Georgia',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'We’re creating a new model for digital publishing. One that supports nuance, complexity, and vital storytelling without giving in to the incentives of advertising. It’s an environment that’s open to everyone but promotes substance and authenticity. And it’s where deeper connections forged between readers and writers can lead to discovery and growth. Together with millions of collaborators, we’re building a trusted and vibrant ecosystem fueled by important ideas and the people who think about them.',
                        style: TextStyle(
                            fontSize: 27,
                            fontFamily: 'Georgia',
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 700,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  padding: const EdgeInsets.all(7.0),
                  child: const Text(
                    "W",
                    style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontSize: 600,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: const Color(0xfff9d0b8),
            height: 380,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 290.0),
              child: Column(
                children: const [
                  Text(
                    'A living network of curious minds.',
                    style: TextStyle(
                        fontSize: 106,
                        fontFamily: 'Georgia',
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Anyone can write on Wizard. Thought-leaders, journalists, experts, and individuals with unique perspectives share their thinking here. You’ll find pieces by independent writers from around the globe, stories we feature and leading authors, and smart takes on our own suite of blogs and publications.',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Soehne web buch',
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            height: 380,
            child: Column(
              children: const [
                SizedBox(
                  width: 1200,
                  child: Text(
                    'Create the space for your ',
                    style: TextStyle(
                        fontSize: 106,
                        color: Colors.white,
                        fontFamily: 'Georgia',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 1000,
                    child: Text(
                      'thinking to take off.',
                      style: TextStyle(
                          fontSize: 106,
                          color: Colors.white,
                          fontFamily: 'Georgia',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: 800,
                    child: Text(
                      "A blank page is also a door. At Wizard you can walk through it. It's easy and free to share your thinking on any topic, connect with an audience, express yourself with a range of publishing tools, and even earn money for your work.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Soehne web buch',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
