import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'package:indonesia_guide/constants/r.dart';

class MenuButton extends StatelessWidget {
  final String routeName;
  final IconData icon;
  final String semanticLabel;
  final String menuTitle;

  const MenuButton({
    Key? key,
    required this.routeName,
    required this.icon,
    required this.semanticLabel,
    required this.menuTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () => Navigator.of(context).pushNamed(routeName),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: R.colors.primary,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                semanticLabel: semanticLabel,
                color: Colors.white70,
                size: 50,
              ),
              const SizedBox(height: 10),
              Text(
                menuTitle,
                style: R.fontStyles.normalWhiteBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
