import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class minusIcon extends StatelessWidget {
  const minusIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          // Placeholder for future logic
          //print("Minus symbol pressed");
        },
        icon: const FaIcon(
          FontAwesomeIcons.circleMinus,
          color: Colors.grey,
          size: 40,));
  }
}
