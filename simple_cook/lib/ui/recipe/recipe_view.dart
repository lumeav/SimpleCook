import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/widgets/preparation.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';
import 'package:simple_cook/widgets/heart_button.dart';
import 'package:simple_cook/widgets/add_planer.dart';
import 'package:simple_cook/widgets/ingredients.dart';
import 'package:simple_cook/common/custom_navbar.dart';

class RecipeView extends StatefulWidget {
  final String imgPath;
  final Widget header;

  const RecipeView({
    Key? key,
    required this.imgPath,
    required this.header,
  }) : super(key: key);

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
      backgroundColor: Colors.grey[200],
      body: Column(children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [AddPlaner(), SizedBox(width: 10), HeartButton(false)],
            )),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // Placeholder for future logic
                  print('extended recipe tapped!');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(
                                      12) // Set the desired border radius for the top left corner
                                  ),
                              child: AspectRatio(
                                  aspectRatio: 1.8,
                                  child: Image.asset(
                                    widget.imgPath,
                                    fit: BoxFit.cover,
                                  )),
                            )
                          ]),
                          widget.header,
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Divider()),
                          Ingredients([
                            "150g Zwiebel",
                            "20ml Olivenöl",
                            "250g Tomate",
                            "500ml Hühnerbrühe",
                            "500g Hähnchenbrust",
                            "15g Zucker (braun)",
                            "10g Chili Chipotle (geräucherte Chili)",
                            "1 Lorbeerblatt",
                            "9 mexikanische Tostadas",
                            "100g Panela-Käse",
                          ]),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Preparation([
                              "Die Zwiebeln schälen, halbieren und in Würfel schneiden.",
                              "In einem großen Topf das Olivenöl erhitzen und die Zwiebeln darin anschwitzen, bis sie glasig sind. Die Tomaten würfeln und zu den Zwiebeln geben.",
                              "Hühnerbrühe, Hähnchenbrust, braunen Zucker, Chipotle-Chili und Lorbeerblätter hinzufügen. Alles gut verrühren und für 30 Minuten auf mittlerer Hitze köcheln lassen, bis die Hähnchenbrust gar ist und die Flüssigkeit um die Hälfte reduziert wurde.",
                              "Den Topf vom Herd nehmen und leicht abkühlen lassen. Anschließend das Hähnchenfleisch mit zwei Gabeln zerpflücken.",
                              "Die Lorbeerblätter entfernen.",
                              "Jede Tostada großzügig mit der Tinga-Mischung belegen. Die roten Zwiebeln in feine Würfel schneiden und zusammen mit dem Panela-Käse über die Tostadas zerbröseln. Nach Belieben mit Korianderblättern garnieren und mit Limettenspalten servieren."
                            ]),
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        )),
      ]),
    );
  }
}
