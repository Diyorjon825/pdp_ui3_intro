import 'package:flutter/material.dart';
import 'package:pdp_ui3/pages/home_page.dart';

class InfoPage {
  String title, content, image;
  InfoPage(this.title, this.content, this.image);
}

List<InfoPage> infoPages = [
  InfoPage(
    "Learn from experts",
    "Select from top instructors around the world",
    'assets/images/image_1.png',
  ),
  InfoPage(
    "Go at your own pace",
    "Enjoy lifetime access to courses on Udemy’s website and app",
    'assets/images/image_2.png',
  ),
  InfoPage(
    "Find video courses",
    "Build your library for your career and personal growth",
    'assets/images/image_3.png',
  ),
];

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            children: infoPages.map((info) => PageWidget(info: info)).toList(),
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          Positioned(
            bottom: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                indecator(),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            right: 20,
            child: (currentPage == infoPages.length - 1)
                ? TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  Widget indecator() {
    var list = <Widget>[];
    for (int i = 0; i < infoPages.length; i++) {
      if (currentPage == i) {
        list.add(dots(false));
      } else {
        list.add(dots(true));
      }
    }
    return Row(
      children: list,
    );
  }

  Widget dots(bool a) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.red,
      ),
      duration: const Duration(milliseconds: 200),
      height: 6,
      width: a ? 6 : 30,
    );
  }
}

class PageWidget extends StatelessWidget {
  InfoPage info;
  PageWidget({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            info.title,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            info.content,
            style: const TextStyle(color: Colors.grey, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Image(image: AssetImage(info.image)),
        ],
      ),
    );
    ;
  }
}
