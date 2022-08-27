import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/constants/route_name.dart';

import 'package:indonesia_guide/widgets/custom_app_bar.dart';

class GeneralInfoPage extends StatelessWidget {
  static const String route = RouteName.routeGeneralInfoPage;
  const GeneralInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: R.strings.travelInformationPageTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: R.colors.primary,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
