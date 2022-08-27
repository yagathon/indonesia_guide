import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indonesia_guide/api/firebase_api_articles.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/main.dart';
import 'package:indonesia_guide/models/article.dart';
import 'package:indonesia_guide/models/user.dart';
import 'package:indonesia_guide/screens/article_filter_page.dart';
import 'package:indonesia_guide/screens/article_submission_page.dart';
import 'package:indonesia_guide/screens/welcome_page.dart';

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
          onTap: () {
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
            onTap: () {
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ArticleSubmission()),
              );
            },
          ),
          // Icon(
          //   Icons.person,
          // ),
        ],
      ),
      body:  StreamBuilder<QuerySnapshot>(
          stream: FirebaseApiArticles.readArticles(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Error Occured! ${snapshot.error.toString()}');
              return Center(child: Text('Sth went wrong!'));
            } else if (snapshot.hasData) {
              List<Object?> datas = snapshot.data!.docs.toList(); 

              return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final currentData = snapshot.data!.docs.toList()[index]; 
                  print('current ' + currentData['title']);
                  return ListTile(
                    leading: CircleAvatar(child: Text( currentData['title'] )),
                  );
                }, 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 2
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).bottomAppBarColor,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
              );
            }
          },
        ),
    );
  }
}
