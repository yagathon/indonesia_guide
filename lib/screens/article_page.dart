import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/util/function_logic.dart';
import 'package:indonesia_guide/widgets/article_viewer.dart';
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

  List<Widget> generatePages() {
    return [
      const ArticleViewer(),
      const ArticleViewer(),
      const ArticleViewer(),
    ];
  }

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
            onTap: () => showComingSoonSnackBar(context),
          ),
          CustomMenuIcon(
            icon: Icons.filter_alt,
            semanticLabel: R.strings.filter,
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 35),
        child: PageView(
          controller: _controller,
          onPageChanged: ((value) {
            setState(() {
              curPage = value;
            });
          }),
          children: generatePages(),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.blueGrey.shade50,
        height: 35,
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
                style: R.fontStyles.normalYellowBold14Spacing,
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
                style: R.fontStyles.normalYellowBold14Spacing,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
