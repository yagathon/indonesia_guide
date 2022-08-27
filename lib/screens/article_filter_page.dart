import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';

class ArticleFilterPage extends StatefulWidget {
  static const String route = RouteName.routeFilterPage;
  const ArticleFilterPage({Key? key}) : super(key: key);

  @override
  State<ArticleFilterPage> createState() => _ArticleFilterPageState();
}

class _ArticleFilterPageState extends State<ArticleFilterPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Filter Page'),
      ),
    );
  }
}
