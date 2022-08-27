import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:indonesia_guide/util/function_logic.dart';
import 'package:indonesia_guide/widgets/menu_button.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class WelcomePage extends StatefulWidget {
  static const String route = RouteName.routeWelcomePage;
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final dummyImages = [
    R.assets.borobudur,
    R.assets.bromo,
    R.assets.wayangKulit,
    R.assets.orangUtan,
    R.assets.rawon,
    R.assets.traditionalHouseWestSumba,
    R.assets.serimpi,
  ];

  final themeMode = ValueNotifier(0);
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to close'),
          ),
          child: SingleChildScrollView(
            primary: true,
            child: Column(
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
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
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
                              children:
                                  dummyImages.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
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
                                        themeMode.value == entry.key
                                            ? 0.9
                                            : 0.4,
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
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: Text(
                    R.strings.welcomePageHeader,
                    style: R.fontStyles.h2BlackBold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey.shade300,
                  ),
                  child: Text(R.strings.aboutIndonesia),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 25,
                  ),
                  width: double.infinity,
                  child: GridView.count(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    children: [
                      MenuButton(
                        icon: Icons.article_outlined,
                        semanticLabel: R.strings.articleSubmission,
                        routeName: RouteName.routeArticleSubmissionPage,
                        menuTitle: R.strings.articleSubmission,
                      ),
                      MenuButton(
                        icon: Icons.filter_alt,
                        semanticLabel: R.strings.filter,
                        routeName: RouteName.routeFilterPage,
                        menuTitle: R.strings.filter,
                      ),
                      MenuButton(
                        icon: Icons.bookmark,
                        semanticLabel: R.strings.bucketList,
                        onTap: () => showComingSoonSnackBar(context),
                        menuTitle: R.strings.bucketList,
                      ),
                      MenuButton(
                        icon: Icons.info_outline,
                        semanticLabel: R.strings.travelInformationPageTitle,
                        routeName: RouteName.routeGeneralInfoPage,
                        //onTap: () => //showComingSoonSnackBar(context),
                        menuTitle: R.strings.travelInformationPageTitle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
