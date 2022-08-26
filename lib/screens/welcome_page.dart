import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/screens/article_filter_page.dart';
import 'package:indonesia_guide/screens/article_page.dart';

class WelcomePage extends StatefulWidget {
  static const String route = RouteName.routeWelcomePage;
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: const Text("Carousel"),
            ),
            Container(
              child: const Text("Welcome to Indonesia"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ArticleFilter()),
                );
              },
              child: Container(
                child: const Text("Go to Filter"),
              ),
            ),
            Container(
              child: const Text("Indonesia Speach"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArticlePage()),
                );
              },
              child: Container(
                child: const Text("Thumbnail"),
              ),
            ),
            Container(
              child: const Text("general Info"),
            ),
          ],
        ),
      ),
    );
  }
}
