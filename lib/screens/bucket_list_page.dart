import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/bucket_card.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';

class BucketListPage extends StatefulWidget {
  static const String route = RouteName.routeBucketListPage;
  const BucketListPage({Key? key}) : super(key: key);

  @override
  State<BucketListPage> createState() => _BucketListPageState();
}

class _BucketListPageState extends State<BucketListPage> {
  List<String> titles = ["Title 1", "Title 2", "Title 3", "Title 4"];
  List<String> places = ["Place 1", "Place 2", "Place 3", "Place 4"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: R.strings.bucketList),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: ListView.builder(
            addSemanticIndexes: true,
            shrinkWrap: true,
            primary: false,
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return BucketCard(
                title: titles[index],
                place: places[index],
                onTap: removeToBucketList(index),
              );
            },
          )),
    );
  }

  removeToBucketList(int index) {
    debugPrint("index $index");
  }
}
