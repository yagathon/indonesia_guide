import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text("Carousel"),),
          Container(
            child: Text("Welcome to Indonesia"),),
    Container(
    child: Text("Go to Filter"),),
          Container(
            child: Text("Indonesia Speach"),),
          Container(
            child: Text("Thumbnail"),),
          Container(
            child: Text("general Info"),),
        ],
      ),
    );
  }
}
