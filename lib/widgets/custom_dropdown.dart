import 'package:flutter/material.dart';
import 'package:indonesia_guide/constants/r.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.title,
    required this.obj,
    required this.callback,
  }) : super(key: key);

  final String title;
  final List<String> obj;
  final Function(String? val) callback;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedClass;

  @override
  void initState() {
    selectedClass = widget.obj[0];
    super.initState();
  }

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
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(color: R.colors.greyBorder),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedClass,
                items: widget.obj
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (String? val) {
                  selectedClass = val!;
                  widget.callback(val);
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
