import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/imgandheart.dart';

class RezeptDesTages extends StatefulWidget {
  final String imgPath;
  final String rezeptName;

  const RezeptDesTages(this.imgPath, this.rezeptName, {Key? key})
      : super(key: key);

  @override
  _RezeptDesTagesState createState() => _RezeptDesTagesState();
}

class _RezeptDesTagesState extends State<RezeptDesTages> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Placeholder for future logic
        print('Rezept des Tages tapped!');
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Ink(
            width: 352,
            height: 262,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Column(
              children: [
                ImgAndHeart(widget.imgPath, true, 352, 189),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text('Rezept des Tages',
                      style: TextStyle(color: Color(0xffFF9F5A), fontSize: 18)),
                ),
                Text(widget.rezeptName,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24))
              ],
            )),
      ),
    );
  }
}
