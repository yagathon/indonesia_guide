import 'package:flutter/material.dart';
import 'package:indonesia_guide/Screen/ArticleSubmission.dart';
import 'package:indonesia_guide/Screen/ArticleFilter.dart';
import 'package:indonesia_guide/Screen/WelcomePage.dart';
import 'package:indonesia_guide/main.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.home,
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WelcomePage()),
            );
          },
        ),
        title: Text("ArticlePage"),
        actions: [
          GestureDetector(
            child: Icon(
              Icons.filter_alt_outlined,
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ArticleFilter()),
              );
            },
          ),
          GestureDetector(
            child: Icon(
              Icons.playlist_add,
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ArticleSubmission()),
              );
            },
          ),
          // Icon(
          //   Icons.person,
          // ),
        ],
      ),
      body: Center(
        child: Text("ArticlePage"),),
    );
  }
}
