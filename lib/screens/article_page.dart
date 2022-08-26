import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';

class ArticlePage extends StatefulWidget {
  static const String route = RouteName.routeArticlePage;
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text("ArticlePage"),
      ),
    );
  }
}
