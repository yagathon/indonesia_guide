import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';
import 'package:indonesia_guide/constants/route_name.dart';

import 'package:indonesia_guide/widgets/custom_app_bar.dart';

class GeneralInfoPage extends StatelessWidget {
  static const String route = RouteName.routeGeneralInfoPage;
  final _scrollController = ScrollController();

  GeneralInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: R.strings.travelInformationPageTitle,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
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
                children: const [
                  Text(
                      "The whole Indonesian archipelago is tropical, with temperatures always between 21°C and 33°C, although cooler in the mountains."),
                  SizedBox(height: 10),
                  SimpleContentText(
                    title: "Emergencies Numbers",
                    content: "Police 110 \n"
                        "Ambulance 118/119 \n"
                        "Fire 113",
                  ),
                  SizedBox(height: 10),
                  SimpleContentText(
                    title: "Money and banks",
                    content:
                        "The Indonesian currency is the rupiah (“Rp”). Notes come in denominations of Rp500 (very rare), Rp1000, Rp5000, Rp10,000, Rp20,000, Rp50,000 and Rp100,000. Coins, mainly used for bemos, come in Rp25 (rare), Rp50, Rp100, Rp500 and Rp1000 denominations. Officially, rupiah are available outside Indonesia, but the currency’s volatile value means that few banks carry it \n"
                        "You’ll find banks capable of handling foreign exchange in provincial capitals and bigger cities throughout Indonesia, and almost every town has at least one or two ATMs, which are also found within most Indomaret and Alfamart convenience stores. These generally accept at least one from Visa, MasterCard or Cirrus-Maestro.",
                  ),
                  SizedBox(height: 10),
                  SimpleContentText(
                      title: "Plugs and Electricity",
                      content:
                          "The standard voltage throughout Indonesia is normally 230 V and with a standard frequency of 50 Hz. If you’re from the UK, Europe, Australia and most of Asia or Africa, most of your phones, laptops and other gadgets could be charged like normal. However, if you come from countries like the United States, Canada, and most South American countries, the range of voltage differs here in Indonesia. \n"
                          "Most power plugs and sockets in Indonesia are type C and F. This plug is the 2 pin socket and plug design which is the standard European plug. If you’re coming from a country that does not use this type of sockets, you should buy an adapter."),
                  SizedBox(height: 10),

                  // ValueListenableBuilder(
                  //   valueListenable: selectedImageIndex,
                  //   builder: (BuildContext context, value, Widget? child) {
                  //     return Container(
                  //       margin: const EdgeInsets.symmetric(vertical: 20),
                  //       child: Column(
                  //         children: [
                  //           Container(
                  //             margin: const EdgeInsets.only(bottom: 10),
                  //             height: 200,
                  //             width: double.infinity,
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(
                  //                 fit: BoxFit.fill,
                  //                 image: dummyImages[selectedImageIndex.value],
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: double.infinity,
                  //             height: 50,
                  //             child: Center(
                  //               child: ListView.separated(
                  //                 separatorBuilder: (context, index) =>
                  //                 const SizedBox(width: 5),
                  //                 scrollDirection: Axis.horizontal,
                  //                 shrinkWrap: true,
                  //                 itemCount: dummyImages.length,
                  //                 itemBuilder: (_, index) {
                  //                   return GestureDetector(
                  //                     onTap: (() {
                  //                       debugPrint("index: $index");
                  //                       selectedImageIndex.value = index;
                  //                     }),
                  //                     child: Container(
                  //                       width: 50,
                  //                       height: 50,
                  //                       decoration: BoxDecoration(
                  //                         image: DecorationImage(
                  //                           colorFilter: ColorFilter.mode(
                  //                             Colors.white.withOpacity(
                  //                                 selectedImageIndex.value ==
                  //                                     index
                  //                                     ? 0.5
                  //                                     : 0),
                  //                             BlendMode.srcOver,
                  //                           ),
                  //                           fit: BoxFit.fill,
                  //                           image: dummyImages[index],
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   );
                  //                 },
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.jumpTo(0);
        },
        backgroundColor: R.colors.primary,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}

class SimpleContentText extends StatelessWidget {
  final String? title;
  final String? content;

  const SimpleContentText({
    Key? key,
    this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title!, style: R.fontStyles.normalBlackBold),
        const SizedBox(height: 5),
        Text(content!),
      ],
    );
  }
}
