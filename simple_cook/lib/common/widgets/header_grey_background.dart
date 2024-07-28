import 'package:flutter/material.dart';

class HeaderGreyBackground extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;

  const HeaderGreyBackground(this.title, this.fontWeight, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: fontWeight,
            ),
          ),
        ));
  }
}
