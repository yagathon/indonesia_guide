import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';
import 'package:indonesia_guide/widgets/custom_dropdown.dart';
import 'package:indonesia_guide/widgets/range_textfield.dart';

class ArticleFilterPage extends StatefulWidget {
  static const String route = RouteName.routeFilterPage;
  const ArticleFilterPage({Key? key}) : super(key: key);

  @override
  State<ArticleFilterPage> createState() => _ArticleFilterPageState();
}

class _ArticleFilterPageState extends State<ArticleFilterPage> {
  String? province;
  String? city;
  int? startBudget;
  int? endBudget;
  String? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: R.strings.filterPageTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          addSemanticIndexes: true,
          shrinkWrap: true,
          primary: false,
          children: [
            const SizedBox(height: 20),
            CustomDropdown(
              title: "Province",
              obj: R.strings.category,
              callback: (val) {
                debugPrint("province: $val");
                province = val;
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            CustomDropdown(
              title: "City",
              obj: R.strings.category,
              callback: (val) {
                debugPrint("city: $val");
                city = val;
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            RangeTextfield(
              title: "Budget",
              hintTextStart: "1000",
              hintTextEnd: "5000",
              keyboardType: TextInputType.number,
              callback: (startValue, endValue) {
                inspect(endValue);
                debugPrint("startValue: $startValue; endValue: $endValue");
                startBudget =
                    startValue!.isNotEmpty ? int.parse(startValue) : 0;
                endBudget = endValue!.isNotEmpty ? int.parse(endValue) : 0;
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            CustomDropdown(
              title: "Category",
              obj: R.strings.category,
              callback: (val) {
                debugPrint("category: $val");
                category = val;
                setState(() {});
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint(
              "Province: ${province ?? R.strings.category[0]}; City: ${city ?? R.strings.category[0]}; Budget from $startBudget to $endBudget; Category: ${category ?? R.strings.category[0]}");

          Navigator.of(context).pushNamed(RouteName.routeArticlePage, arguments: {'category' : category, 'province' : province, 'city' : city});
        },
        backgroundColor: R.colors.primary,
        child: const Icon(Icons.search_outlined),
      ),
    );
  }
}
