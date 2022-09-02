import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class HowToGetTherePage extends StatefulWidget {
  static const String route = RouteName.routeArticleHowToGetThere;

  final String title;
  final String place;
  final String address;
  final String? desc;
  final String nativeVoice;
  const HowToGetTherePage({
    Key? key,
    this.title = "",
    this.place = "",
    this.nativeVoice = "How to get there in native language",
    this.address = "Street name 123A \nBlock 45689 \n40291",
    this.desc,
  }) : super(key: key);

  @override
  State<HowToGetTherePage> createState() => _HowToGetTherePageState();
}

class _HowToGetTherePageState extends State<HowToGetTherePage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 80,
            top: 20,
            right: 30,
            left: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: R.fontStyles.h2BlackBold),
              const SizedBox(height: 10),
              Text(widget.place, style: R.fontStyles.normalBlackBold),
              const SizedBox(height: 20),
              Container(
                color: Colors.transparent,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: R.assets.exampleMap,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                // width: 250,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.shade300,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.nativeVoice),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.volume_up,
                      semanticLabel: "How to get there in native language",
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.address,
                style: R.fontStyles.normalBlackBold,
              ),
              const SizedBox(height: 10),
              Text(widget.desc ?? lorem(paragraphs: 1, words: 100)),
            ],
          ),
        ),
      ),
    );
  }
}
