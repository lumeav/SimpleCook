import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/RezeptdesTages.dart';
import 'package:simple_cook/widgets/imgandheart.dart';
import 'package:simple_cook/widgets/recipeInfos.dart';

class WhiteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      width: 352, // Light grey background color
      //padding: EdgeInsets.only( left: 16, right: 16, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImgAndHeart('assets/flammkuchen.jpg', true, 352, 189),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Flammkuchen',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            RecipeInfos('31', 'einfach'),
            Text(
              'This is a scrollable area with a grey background.',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'This is a scrollable area with a grey background.',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'This is a scrollable area with a grey background.',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'This is a scrollable area with a grey background.',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'This is a scrollable area with a grey background.',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'This is a scrollable area with a grey background.',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'This is a scrollable area with a grey background.',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'This is a scrollable area with a grey background.',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'This is a scrollable area with a grey background.',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'This is a scrollable area with a grey background.',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'This is a scrollable area with a grey background.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
