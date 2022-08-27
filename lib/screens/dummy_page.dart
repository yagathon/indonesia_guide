import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/route_name.dart';

class DummyPage extends StatefulWidget {
  static const String route = RouteName.routeDummyPage;
  const DummyPage({Key? key}) : super(key: key);

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Dummy Page'),
      ),
    );
  }
}
