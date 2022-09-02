import 'dart:async';

import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/constants/route_name.dart';
import 'package:indonesia_guide/screens/welcome_page.dart';
import 'package:lottie/lottie.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashScreen extends StatefulWidget {
  static const String route = RouteName.routeSplashScreen;
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      Navigator.of(context).pushReplacementNamed(WelcomePage.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.primary,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: -150,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset(
                    R.assets.indonesiaMap,
                    width: MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.cover,
                  ),
                  TextAnimator(
                    R.strings.appNameHeader,
                    incomingEffect: WidgetTransitionEffects.incomingScaleUp(),
                    atRestEffect: WidgetRestingEffects.wave(),
                    outgoingEffect: WidgetTransitionEffects.outgoingScaleUp(),
                    style: R.fontStyles.szWhite50,
                  ),
                  TextAnimator(
                    R.strings.appNameFooter,
                    incomingEffect: WidgetTransitionEffects.incomingScaleUp(),
                    atRestEffect: WidgetRestingEffects.wave(),
                    outgoingEffect: WidgetTransitionEffects.outgoingScaleUp(),
                    style: R.fontStyles.szBlack24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
