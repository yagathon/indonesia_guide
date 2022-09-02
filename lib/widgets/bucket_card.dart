import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';

class BucketCard extends StatefulWidget {
  final Function()? onTap;
  final String title;
  final String place;
  const BucketCard({
    Key? key,
    this.onTap,
    required this.title,
    required this.place,
  }) : super(key: key);

  @override
  State<BucketCard> createState() => _BucketCardState();
}

class _BucketCardState extends State<BucketCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.grey.shade300,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: R.fontStyles.h4BlackBold),
              Text(widget.place, style: R.fontStyles.normalBlackBold),
            ],
          ),
          GestureDetector(
            onTap: () => widget.onTap,
            child: Icon(
              Icons.bookmark_remove_outlined,
              color: R.colors.primary,
              semanticLabel: R.strings.articleViewerRemoveBucketList,
            ),
          ),
        ],
      ),
    );
  }
}
