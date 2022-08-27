import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final bool isArrowInvisible;
  final double customPreferedSize;
  final String? title;
  final List<Widget>? actionWidgets;

  const CustomAppBar({
    Key? key,
    // this.isArrowInvisible = true,
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
      actions: actionWidgets,
      iconTheme: const IconThemeData(color: Colors.white70),
    );
  }

  @override
  Size get preferredSize {
    double result = customPreferedSize;
    return Size.fromHeight(result);
  }
}
