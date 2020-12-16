import 'package:flutter/material.dart';
import 'package:pdp_ui4/strings/stringss.dart';

import 'loginpage.dart';

class IntroPage extends StatefulWidget {
  static final String id = "intro_page";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _pageController;
  int currentIndex = 0;
  bool mySkip = false;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                  if (page == 2) {
                    mySkip = true;
                  } else {
                    mySkip = false;
                  }
                });
              },
              controller: _pageController,
              children: [
                makePage(
                    image: 'assets/images/image_1.png',
                    title: Stringss.stepOneTitle,
                    content: Stringss.stepOneContent),
                makePage(
                    reverse: true,
                    image: 'assets/images/image_2.png',
                    title: Stringss.stepTwoTitle,
                    content: Stringss.stepTwoContent),
                makePage(
                    image: 'assets/images/image_3.png',
                    title: Stringss.stepThreeTitle,
                    content: Stringss.stepThreeContent),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(height: 50),
                  if (mySkip)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, LoginPage.id);
                          },
                          child: Container(
                            height: 40,
                            width: 60,
                            alignment: Alignment.center,
                            // margin: EdgeInsets.only(right: 20, left: 20),
                            decoration: BoxDecoration(
                                color: Colors.grey[300].withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicator(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Container(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 5,
        width: isActive ? 40 : 5,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
