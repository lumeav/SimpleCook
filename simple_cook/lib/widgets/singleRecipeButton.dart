import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/imgandheart.dart';

class singleRecipeButton extends StatefulWidget {
  final String imgPath;
  final String rezeptName;

  const singleRecipeButton(this.imgPath, this.rezeptName, {Key? key}) : super(key: key);

  @override
  _singleRecipeButtonState createState() => _singleRecipeButtonState();
}

class _singleRecipeButtonState extends State<singleRecipeButton> {
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
                color:const Color.fromARGB(255, 214, 214, 214),
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