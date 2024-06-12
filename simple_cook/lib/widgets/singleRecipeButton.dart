import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/imgandheart.dart';

class SingleRecipeButton extends StatefulWidget {
  final String imgPath;
  final String rezeptName;

  const SingleRecipeButton(this.imgPath, this.rezeptName, {Key? key}) : super(key: key);

  @override
  _SingleRecipeButtonState createState() => _SingleRecipeButtonState();
}

class _SingleRecipeButtonState extends State<SingleRecipeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: InkWell(
          onTap: () {
            // Placeholder for future logic
            print('Rezept tapped!');
          },
          child: Ink (
              width: 165,
              height: 218,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:Colors.white,
              ),
              child: Column(
                  children: [
                    ImgAndHeart(widget.imgPath, true, 165, 165),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        softWrap: true,
                        widget.rezeptName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                )
                ),
          ),
    );
  }
}