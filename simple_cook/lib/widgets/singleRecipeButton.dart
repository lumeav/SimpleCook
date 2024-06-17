import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/imgandheart.dart';
import 'package:simple_cook/widgets/heartButton.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SingleRecipeButton extends StatefulWidget {
  final String imgPath;
  final String rezeptName;

  const SingleRecipeButton(this.imgPath, this.rezeptName, {Key? key})
      : super(key: key);

  @override
  _SingleRecipeButtonState createState() => _SingleRecipeButtonState();
}

class _SingleRecipeButtonState extends State<SingleRecipeButton> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width * 0.55;
    return Container(
      height: height,
      //margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          // Placeholder for future logic
          print('Rezept tapped!');
        },
        child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12) // Set the desired border radius for the top left corner
                          ),
                        child: AspectRatio(
                        aspectRatio: 1.1,
                        child: Image.asset(
                          widget.imgPath,
                          fit: BoxFit.cover,
                        ),
                        ),
                      ),
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: HeartButton(true),
                    )
                  ],
                ),
                Container (
                  padding: EdgeInsets.all(5),
                  //margin: EdgeInsets.all(5),
                  child: Flexible(
                    //textAlign: TextAlign.center,
                    child: Text(
                      widget.rezeptName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                  ),
                ),)
              ],
            )),
      ),
    );
  }
}
