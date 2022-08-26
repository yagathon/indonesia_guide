import 'package:flutter/material.dart';

class ArticleSubmission extends StatefulWidget {
  const ArticleSubmission({Key? key}) : super(key: key);

  @override
  _ArticleSubmissionState createState() => _ArticleSubmissionState();
}

class _ArticleSubmissionState extends State<ArticleSubmission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Text('Submission Form'),),
    );
  }
}
