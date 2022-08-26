import 'package:flutter/material.dart';

class ArticleFilter extends StatefulWidget {
  const ArticleFilter({Key? key}) : super(key: key);

  @override
  _ArticleFilterState createState() => _ArticleFilterState();
}

class _ArticleFilterState extends State<ArticleFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(child: Text('Filter Page'),),
    );
  }
}
