import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indonesia_guide/api/firebase_api_articles.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/models/article.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';

class ArticleSubmissionpage extends StatefulWidget {
  static const String route = RouteName.routeArticleSubmissionPage;
  const ArticleSubmissionpage({Key? key}) : super(key: key);

  @override
  State<ArticleSubmissionpage> createState() => _ArticleSubmissionPageState();
}

class _ArticleSubmissionPageState extends State<ArticleSubmissionpage> {
  final titleController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  final descController = TextEditingController();  
  final ratingController = TextEditingController();  
  final budgetController = TextEditingController();  
  final categoryController = TextEditingController();  

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Upload Image'),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: R.colors.primary, //<-- SEE HERE
                  primary: Colors.white,
                ),
                onPressed: () {},
                child: const Text(
                  'UploadIMage',
                ),
              ),
            ]),
            
            Text('Article'),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null, // <-- SEE HERE
            ),
            Text('Rating'),
            TextField(controller: descController,),
            Text('Budget'),
            TextField(controller: descController,),
            Text('Category'),
            TextField(controller: descController,),
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
