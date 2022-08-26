import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/route_name.dart';

class GeneralInfoPage extends StatelessWidget {
  static const String route = RouteName.routeGeneralInfoPage;
  const GeneralInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('GeneralInfo'),
      ),
    );
  }
}
