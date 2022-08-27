import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/widgets/custom_app_bar.dart';
import 'package:indonesia_guide/widgets/custom_menu_icon.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ArticlePage extends StatefulWidget {
  static const String route = RouteName.routeArticlePage;
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final _controller = PageController();
  var totalPage = 3;
  var curPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actionWidgets: [
          CustomMenuIcon(
            icon: Icons.bookmark,
            semanticLabel: R.strings.bucketList,
            routeName: RouteName.routeDummyPage,
          ),
          CustomMenuIcon(
            icon: Icons.filter_alt,
            semanticLabel: R.strings.filter,
            routeName: RouteName.routeDummyPage,
          ),
          CustomMenuIcon(
            icon: Icons.share,
            semanticLabel: R.strings.shareArticle,
            onTap: () {
              debugPrint("share");
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _controller,
          onPageChanged: ((value) {
            setState(() {
              curPage = value;
            });
          }),
          children: [
            Container(
              child: Container(
                color: Colors.transparent,
                child: const Center(child: Text("Page 1")),
              ),
            ),
            Container(
              color: Colors.transparent,
              child: const Center(child: Text("Page 2")),
            ),
            Container(
              color: Colors.transparent,
              child: const Center(child: Text("Page 3")),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.transparent,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                if (curPage != 0) {
                  final page = curPage - 1;
                  _controller.jumpToPage(page);
                }
              },
              child: Text(
                curPage != 0 ? "PREV" : "",
                style: R.fontStyles.normalYellowBold18,
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: totalPage,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black12,
                  activeDotColor: R.colors.primary,
                ),
                onDotClicked: ((index) => _controller.animateToPage(
                      index,
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeIn,
                    )),
              ),
            ),
            TextButton(
              onPressed: () {
                if (curPage != (totalPage - 1)) {
                  final page = curPage + 1;
                  _controller.jumpToPage(page);
                }
              },
              child: Text(
                curPage != (totalPage - 1) ? "NEXT" : "",
                style: R.fontStyles.normalYellowBold18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
