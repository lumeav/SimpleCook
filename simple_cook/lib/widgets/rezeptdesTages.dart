import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/imgandheart.dart';
import 'package:simple_cook/widgets/headerRezeptdesTages.dart';
import 'package:simple_cook/widgets/heartButton.dart';
class RezeptDesTages extends StatefulWidget {
  final String imgPath;
  final Widget header;


  const RezeptDesTages(this.imgPath, this.header, {Key? key})
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
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
                          aspectRatio: 1.8,
                          child: Image.asset(
                            widget.imgPath,
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: HeartButton(true),
                    )
                  ]
                ),
                widget.header
              ],
            )),
      ),
    );
  }
}


//(widget.imgPath, true, 352, 189),