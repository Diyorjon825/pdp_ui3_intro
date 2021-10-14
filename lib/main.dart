import 'package:flutter/material.dart';
import 'package:pdp_ui3/pages/intro.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const IntroPage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}
