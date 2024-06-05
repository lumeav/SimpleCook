import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  final String imgPath;
  final double width;
  final double height;

  const Img(this.imgPath, this.width, this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12) // Set the desired border radius for the top left corner
      ),
      child: Image.asset(
        imgPath,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
