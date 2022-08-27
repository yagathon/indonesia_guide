import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:indonesia_guide/util/function_logic.dart';

class ArticleViewer extends StatefulWidget {
  final String title;
  final String place;
  final String content;
  final String budget;
  final String categories;
  final double curRate;
  final int imageIndex;

  const ArticleViewer({
    Key? key,
    required this.title,
    required this.content,
    required this.budget,
    required this.categories,
    required this.curRate,
    required this.place,
    required this.imageIndex,
  }) : super(key: key);

  @override
  State<ArticleViewer> createState() => _ArticleViewerState();
}

class _ArticleViewerState extends State<ArticleViewer> {
  // bool _showGoTopButton = false;
  // late ScrollController _scrollController;
  late String title;
  late String place;
  late String content;
  late String budget;
  late String categories;
  late double curRate;
  ValueNotifier selectedImageIndex = ValueNotifier(0);

  final dummyImages = [
    R.assets.moramo,
    R.assets.stIsland,
    R.assets.batik,
    R.assets.wayangKulit,
    R.assets.orangUtan
  ];

  @override
  void initState() {
    super.initState();

    // _scrollController = ScrollController()
    //   ..addListener(() {
    //     // setState(() {
    //     if (_scrollController.offset >= 400) {
    //       _showGoTopButton = true;
    //     } else {
    //       _showGoTopButton = false;
    //     }
    //     // });
    //   });
    processing();
  }

  processing() {
    title = widget.title;
    place = widget.place;
    content = widget.content;
    budget = widget.budget;
    categories = widget.categories;
    curRate = widget.curRate;
    selectedImageIndex = ValueNotifier(widget.imageIndex);
    setState(() {});
  }

  addToBucketList() {
    debugPrint("addToBucketList");
    showComingSoonSnackBar(context);
  }

  shareArticle() {
    debugPrint("shareArticle");
    Clipboard.setData(
      const ClipboardData(
        text: "https://indonesiaguide.page.link/article_page",
      ),
    ).then((value) => showShareSnackBar(context));
  }

  giveRate(double star) {
    debugPrint("giveRate => ${star.toString()}");
    showComingSoonSnackBar(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // controller: _scrollController,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 80,
            top: 30,
            right: 30,
            left: 30,
          ),
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(title, style: R.fontStyles.h2BlackBold),
                      ),
                      const SizedBox(width: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => addToBucketList(),
                            child: Icon(
                              Icons.bookmark_add_outlined,
                              color: R.colors.primary,
                              semanticLabel:
                                  R.strings.articleViewerAddBucketList,
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () => shareArticle(),
                            child: Icon(
                              Icons.share,
                              color: R.colors.primary,
                              semanticLabel: R.strings.shareArticle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(place, style: R.fontStyles.normalBlackBold),
                  ValueListenableBuilder(
                    valueListenable: selectedImageIndex,
                    builder: (BuildContext context, value, Widget? child) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: dummyImages[selectedImageIndex.value],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: Center(
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 5),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: dummyImages.length,
                                  itemBuilder: (_, index) {
                                    return GestureDetector(
                                      onTap: (() {
                                        debugPrint("index: $index");
                                        selectedImageIndex.value = index;
                                      }),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            colorFilter: ColorFilter.mode(
                                              Colors.white.withOpacity(
                                                  selectedImageIndex.value ==
                                                          index
                                                      ? 0.5
                                                      : 0),
                                              BlendMode.srcOver,
                                            ),
                                            fit: BoxFit.fill,
                                            image: dummyImages[index],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Text(content),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Text(
                          R.strings.articleViewerRatingIntro,
                          style: R.fontStyles.normalBlackBold,
                        ),
                        const SizedBox(height: 10),
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            semanticLabel: "${index.toString()} star(s)",
                          ),
                          onRatingUpdate: (rating) => giveRate(rating),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: _showGoTopButton == false
      //     ? null
      //     : FloatingActionButton(
      //         onPressed: (() {}),
      //         backgroundColor: R.colors.primary,
      //         child: const Icon(Icons.arrow_upward),
      //       ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        color: Colors.blueGrey.shade50,
        height: 80,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Budget: \$$budget",
                  style: R.fontStyles.normalBlackBold,
                ),
                Text(
                  "Category: $categories",
                  style: R.fontStyles.normalBlackBold,
                ),
              ],
            ),
            RatingBar.builder(
              ignoreGestures: true,
              initialRating: curRate,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 20,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
                semanticLabel: "${index.toString()} star(s)",
              ),
              onRatingUpdate: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
