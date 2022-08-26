import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isArrowInvisible;
  final double customPreferedSize;
  final String? title;
  final List<Widget>? actionWidgets;

  const CustomAppBar({
    Key? key,
    this.isArrowInvisible = true,
    this.customPreferedSize = 56,
    this.title,
    this.actionWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5.0,
      title: Text(title ?? ""),
      centerTitle: true,
      shadowColor: Colors.grey.shade200,
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: isArrowInvisible
            ? () {
                Navigator.pop(context);
              }
            : () {},
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: isArrowInvisible ? Colors.black : Colors.transparent,
            // size: 15.0,
          ),
        ),
      ),
      actions: actionWidgets,
    );
  }

  @override
  Size get preferredSize {
    double result = customPreferedSize;
    return Size.fromHeight(result);
  }
}
