import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/buttonHeart.dart';

class ImgAndHeart extends StatelessWidget {
  final String imgPath;
  final bool border;
  final double width;
  final double height;

  const ImgAndHeart(this.imgPath, this.border, this.width, this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
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
        ),
        const Positioned(
          bottom: 10,
          right: 10,
          child: ButtonHeart(true, 28),
        )
      ],
    );
  }
}
