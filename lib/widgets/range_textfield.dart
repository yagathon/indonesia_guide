import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';

class RangeTextfield extends StatefulWidget {
  const RangeTextfield({
    Key? key,
    required this.title,
    required this.hintTextStart,
    required this.hintTextEnd,
    required this.callback,
    this.keyboardType = TextInputType.none,
  }) : super(key: key);

  final String title;
  final String hintTextStart;
  final String hintTextEnd;
  final TextInputType? keyboardType;
  final Function(String? startValue, String? endValue) callback;

  @override
  State<RangeTextfield> createState() => _RangeTextfieldState();
}

class _RangeTextfieldState extends State<RangeTextfield> {
  var startCtr = TextEditingController();
  var endCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: R.colors.greySubtitle),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  enabled: true,
                  keyboardType: widget.keyboardType,
                  controller: startCtr,
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    hintText: widget.hintTextStart,
                    hintStyle: TextStyle(
                      color: R.colors.greyHintText,
                    ),
                  ),
                  onEditingComplete: () {
                    widget.callback(startCtr.text, endCtr.text);
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  "-",
                  textAlign: TextAlign.center,
                  style: R.fontStyles.normalBlackBold,
                ),
              ),
              Flexible(
                flex: 1,
                child: TextField(
                  enabled: true,
                  keyboardType: widget.keyboardType,
                  controller: endCtr,
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    hintText: widget.hintTextEnd,
                    hintStyle: TextStyle(
                      color: R.colors.greyHintText,
                    ),
                  ),
                  onEditingComplete: () {
                    debugPrint("apa sih ${endCtr.text}");
                    widget.callback(startCtr.text, endCtr.text);
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
