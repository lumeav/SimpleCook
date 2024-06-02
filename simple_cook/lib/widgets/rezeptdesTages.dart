import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/imgandheart.dart';

class RezeptdesTages extends StatefulWidget {
  final String imgPath;
  final String rezeptName;

  const RezeptdesTages(this.imgPath, this.rezeptName, {Key? key}) : super(key: key);

  @override
  _RezeptdesTagesState createState() => _RezeptdesTagesState();
}

class _RezeptdesTagesState extends State<RezeptdesTages> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Placeholder for future logic
          print('Rezept des Tages tapped!');
        },
        child: Ink (
          width: 352,
          height: 262,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white
          ),
          child: Column(
              children: [
                ImgAndHeart(widget.imgPath, true, 352, 189),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    'Rezept des Tages',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18)
                    ),
                ),
                Text(
                  widget.rezeptName,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)
                  )
              ],
            )
            ),
        );

  }
}
