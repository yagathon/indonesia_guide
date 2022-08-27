import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indonesia_guide/api/firebase_api_articles.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/models/article.dart';

class ArticleSubmission extends StatefulWidget {
  const ArticleSubmission({Key? key}) : super(key: key);

  @override
  _ArticleSubmissionState createState() => _ArticleSubmissionState();
}

class _ArticleSubmissionState extends State<ArticleSubmission> {
   final titleController = TextEditingController();
   final cityController = TextEditingController();
    final provinceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Submission Form'),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
        child: ListView(
          primary: true,
          children: [
            Text('Title'),
            TextField(controller: titleController,),
            Text('City'),
            TextField(controller: cityController,),
            Text('Province'),
            TextField(controller: provinceController,),
          ],            
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final name = titleController.text;

          FirebaseApiArticles.createArticle(name: name, context: context);     

          clearControllers();

        },
        backgroundColor: R.colors.primary,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  clearControllers(){
    titleController.clear();    
  }

  
}
