import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/screens/article_filter_page.dart';
import 'package:indonesia_guide/screens/article_page.dart';
import 'package:indonesia_guide/screens/article_submission_page.dart';
import 'package:indonesia_guide/screens/dummy_page.dart';
import 'package:indonesia_guide/screens/general_info_page.dart';
import 'package:indonesia_guide/screens/splash_screen.dart';
import 'package:indonesia_guide/screens/welcome_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  // Get any initial links
  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) => runApp(MyApp(initialLink)),
  );
}

class MyApp extends StatelessWidget {
  PendingDynamicLinkData? initialLink;
  MyApp(this.initialLink, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (initialLink != null) {
    //   debugPrint("atas");
    //   final Uri? deepLink = initialLink?.link;
    //   // Example of using the dynamic link to push thea user to a different screen
    //   Navigator.pushNamed(context, deepLink!.path);
    // } else {
    //   debugPrint("bawah");
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: R.strings.appName,
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: R.colors.primary,
        ),
        scaffoldBackgroundColor: R.colors.grey,
        primarySwatch: Colors.blue,
      ),
      // home: const SplashScreen(),
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (context) => const SplashScreen(),
        DummyPage.route: (context) => const DummyPage(),
        WelcomePage.route: (context) => const WelcomePage(),
        ArticleSubmissionpage.route: (context) => const ArticleSubmissionpage(),
        ArticleFilterPage.route: (context) => const ArticleFilterPage(),
        ArticlePage.route: (context) => const ArticlePage(),
        GeneralInfoPage.route: (context) => const GeneralInfoPage(),
      },
    );
  }
}
