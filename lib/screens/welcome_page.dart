import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';
import 'package:indonesia_guide/widgets/custom_menu_icon.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomePage extends StatefulWidget {
  static const String route = RouteName.routeWelcomePage;
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final dummyImages = [
    R.assets.dummyImage1,
    R.assets.dummyImage2,
    R.assets.dummyImage3,
    R.assets.dummyImage4,
    R.assets.dummyImage5
  ];

  final themeMode = ValueNotifier(0);
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          isArrowInvisible: false,
          actionWidgets: [
            CustomMenuIcon(
              icon: Icons.article_outlined,
              semanticLabel: "Create Article",
              routeName: RouteName.routeDummyPage,
            ),
            CustomMenuIcon(
              icon: Icons.filter_alt,
              semanticLabel: "Search By Filter",
              routeName: RouteName.routeDummyPage,
            ),
            CustomMenuIcon(
              icon: Icons.bookmark,
              semanticLabel: "My Bucket List",
              routeName: RouteName.routeDummyPage,
            ),
            CustomMenuIcon(
              icon: Icons.info_outline,
              semanticLabel: "General Info",
              routeName: RouteName.routeGeneralInfoPage,
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.black38,
              width: double.infinity,
              child: ValueListenableBuilder(
                valueListenable: themeMode,
                builder: (BuildContext context, value, Widget? child) {
                  return Stack(
                    children: [
                      CarouselSlider(
                        carouselController: _controller,
                        options: CarouselOptions(
                          initialPage: 0,
                          viewportFraction: 1,
                          autoPlay: false,
                          autoPlayCurve: Curves.linear,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          onPageChanged: ((index, reason) {
                            themeMode.value = index;
                          }),
                        ),
                        items: dummyImages
                            .map(
                              (item) => Image(
                                image: item,
                                semanticLabel:
                                    "Image Slideshow ${themeMode.value}",
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            )
                            .toList(),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: dummyImages.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.grey)
                                      .withOpacity(
                                    themeMode.value == entry.key ? 0.9 : 0.4,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Text(
                R.strings.welcomePageHeader,
                style: R.fontStyles.h1BlackBolds,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.grey.shade300,
              ),
              child: Text(lorem(paragraphs: 1, words: 50)),
            ),
          ],
        ),
      ),
    );
  }
}
