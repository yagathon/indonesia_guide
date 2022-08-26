import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';

class ArticleSubmissionpage extends StatefulWidget {
  static const String route = RouteName.routeArticleSubmissionPage;
  const ArticleSubmissionpage({Key? key}) : super(key: key);

  @override
  State<ArticleSubmissionpage> createState() => _ArticleSubmissionpageState();
}

class _ArticleSubmissionpageState extends State<ArticleSubmissionpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Submission Form'),
      ),
    );
  }
}
