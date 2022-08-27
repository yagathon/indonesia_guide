import 'package:flutter/material.dart';

class CustomMenuIcon extends StatelessWidget {
  final String? routeName;
  final IconData icon;
  final String semanticLabel;
  final Function()? onTap;

  const CustomMenuIcon({
    Key? key,
    this.routeName,
    required this.icon,
    required this.semanticLabel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {
          if (routeName != null) {
            Navigator.of(context).pushNamed(routeName!);
          } else if (onTap != null) {
            onTap!();
          } else {
            debugPrint("No Binding Action Found");
          }
        },
        child: Icon(
          icon,
          semanticLabel: semanticLabel,
          color: Colors.white70,
        ),
      ),
    );
  }
}
