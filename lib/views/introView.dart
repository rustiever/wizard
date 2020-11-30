import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:wizard/widgets/widgets.dart';

class IntroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
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
          const Padding(
            padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
            child: Text(
              'Dive deeper on topics that \n matter to you.',
              textAlign: TextAlign.center,
              textScaleFactor: 5,
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontFamily: "Times New Roman"),
            ),
          ),
          const Text(
            "Search what you're into. We'll help you find great things to read.",
            textAlign: TextAlign.center,
            textScaleFactor: 1.5,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            heightFactor: 2.5,
            child: SizedBox(
              width: 370,
              child: GetStartedButton(),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account?",
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await Get.dialog(
                            AuthWidget(
                              isSignUp: false,
                            ),
                          );
                        },
                      text: ' Sign In',
                      style: const TextStyle(
                          color: Color(0xff4ba97d), fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100.0, 50.0, 100.0, 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundColor: Color(0xff4ba97d),
                  radius: 15,
                  child: Icon(Icons.check),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "World-class publications.",
                  style: TextStyle(
                    color: Color(0xff757575),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: Color(0xff4ba97d),
                  radius: 15,
                  child: Icon(Icons.check),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Undiscovered voices.",
                  style: TextStyle(
                    color: Color(0xff757575),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: Color(0xff4ba97d),
                  radius: 15,
                  child: Icon(Icons.check),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Topics you love.",
                  style: TextStyle(
                    color: Color(0xff757575),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "All on Wizard, all for you.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Text(
              'No ads. No problems.',
              textScaleFactor: 5,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: "Times New Roman"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Text(
              'Your privacy stays yours. We don’t sell your data or target you with ads. Ever.',
              style: TextStyle(
                  color: Color(0xff757575),
                  fontSize: 20.0,
                  fontFamily: "Lucida Sans"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 90.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 350,
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        width: 370,
                        child: GetStartedButton(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 350,
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'We do things differently.',
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lucida Sans"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Wizard is not like any other platform on the internet. Our sole purpose is to help you find compelling ideas, knowledge, and perspectives. We don’t serve ads—we serve you, the curious reader who loves to learn new things. wizard is home to thousands of independent voices, and we combine humans and technology to find the best reading for you—and filter out the rest.",
                        style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 24.0,
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Lucida Sans"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "One Subscription. Unlimited Ideas.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Lucida Sans"),
          ),
          const SizedBox(
            height: 35,
          ),
          const Text(
            "Read unlimited stories with an optional subscription of \$5/month.\nIf it's not for you, cancel anytime.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff757575),
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                fontFamily: "Lucida Sans"),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Expand your reading.\nExpand your mind.',
            textAlign: TextAlign.center,
            textScaleFactor: 5,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontFamily: "Times New Roman"),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            heightFactor: 2.5,
            child: SizedBox(
              width: 370,
              child: GetStartedButton(),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 270,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: const Color(0xffe6e6e6),
                        margin: const EdgeInsets.only(left: 20.0),
                        padding: const EdgeInsets.all(7.0),
                        child: const Text(
                          "W",
                          style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IntroPageFlatButton(
                            title: 'Getting Started',
                            onPressed: () {},
                          ),
                          IntroPageFlatButton(
                            title: 'Subscribe',
                            onPressed: () {},
                          ),
                          IntroPageFlatButton(
                            title: 'Have an account? Sign in',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IntroPageFlatButton(
                            title: 'About Wizard',
                            onPressed: () {},
                          ),
                          IntroPageFlatButton(
                            title: 'Write',
                            onPressed: () {},
                          ),
                          IntroPageFlatButton(
                            title: 'Gift',
                            onPressed: () {},
                          ),
                          IntroPageFlatButton(
                            title: 'Help',
                            onPressed: () {},
                          ),
                          IntroPageFlatButton(
                            title: 'Press Contacts',
                            onPressed: () {},
                          ),
                          IntroPageFlatButton(
                            title: 'Careers',
                            onPressed: () {},
                          ),
                          IntroPageFlatButton(
                            title: 'Privacy',
                            onPressed: () {},
                          ),
                          IntroPageFlatButton(
                            title: 'Terms',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "© 2020 A wizard Corporation",
                          style: TextStyle(
                            color: Color(0xff707070),
                            fontFamily: "Lucida Sans",
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
