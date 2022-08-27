import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArticleViewer extends StatefulWidget {
  const ArticleViewer({
    Key? key,
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
  final selectedImageIndex = ValueNotifier(0);

  final dummyImages = [
    R.assets.dummyImage1,
    R.assets.dummyImage2,
    R.assets.dummyImage3,
    R.assets.dummyImage4,
    R.assets.dummyImage5
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
    title = "Saung Angklung Udjo";
    place = "Bandung, West Java";
    content = lorem(paragraphs: 2, words: 200);
    budget = "100";
    categories = "Destination, Event";
    curRate = 3;
    setState(() {});
  }

  addToBucketList() {
    debugPrint("addToBucketList");
  }

  giveRate(double star) {
    debugPrint("giveRate => ${star.toString()}");
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
                      GestureDetector(
                        onTap: () => addToBucketList(),
                        child: Icon(
                          Icons.bookmark_add_outlined,
                          color: R.colors.primary,
                          semanticLabel: R.strings.articleViewerAddBucketList,
                        ),
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
