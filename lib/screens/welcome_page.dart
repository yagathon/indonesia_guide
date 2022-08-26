import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';
import 'package:indonesia_guide/widgets/custom_menu_icon.dart';

class WelcomePage extends StatefulWidget {
  static const String route = RouteName.routeWelcomePage;
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
              height: 200,
              child: Image(
                image: R.assets.dummyImage1,
                semanticLabel: "Image Slideshow",
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                R.strings.welcomePageHeader,
                style: R.fontStyles.h1BlackBolds,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
