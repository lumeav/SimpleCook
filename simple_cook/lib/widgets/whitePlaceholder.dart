import 'package:flutter/material.dart';

class WhitePlaceholder extends StatelessWidget {
  final double height;

  const WhitePlaceholder(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.white,
    );
  }
}