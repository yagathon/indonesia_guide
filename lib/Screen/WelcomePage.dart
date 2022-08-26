import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indonesia_guide/Screen/ArticleFilter.dart';
import 'package:indonesia_guide/Screen/ArticlePage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Text("Carousel"),),
            Container(
              child: Text("Welcome to Indonesia"),),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArticleFilter()),
                );
              },
              child: Container(
              child: Text("Go to Filter"),),
            ),
            Container(
              child: Text("Indonesia Speach"),),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArticlePage()),
                );
              },
              child: Container(
                child: Text("Thumbnail"),
              ),
            ),
            Container(
              child: Text("general Info"),),
          ],
        ),
      ),
    );
  }
}
