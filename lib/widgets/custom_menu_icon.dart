import 'package:flutter/material.dart';

class CustomMenuIcon extends StatelessWidget {
  final String routeName;
  final IconData icon;
  final String semanticLabel;

  const CustomMenuIcon({
    Key? key,
    required this.routeName,
    required this.icon,
    required this.semanticLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(routeName),
        child: Icon(
          icon,
          semanticLabel: semanticLabel,
        ),
      ),
    );
  }
}
