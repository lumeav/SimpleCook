import 'package:flutter/material.dart';

class HeaderGreyBackground extends StatelessWidget {
  final String title;

  const HeaderGreyBackground(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 10),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
