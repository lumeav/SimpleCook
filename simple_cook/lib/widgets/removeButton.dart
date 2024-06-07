import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, // Adjust width as needed
      height: 50, // Adjust height as needed
      decoration: BoxDecoration(
        shape: BoxShape.circle, //doing it like this because it is way more complicated to get two FaIcons working together with "onPressed"
        border: Border.all(
          color: Colors.grey,
          width: 3,

        ) // Adjust circle color and opacity
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Placeholder for future logic
            // print("Minus symbol pressed");
          },
          icon: const FaIcon(
            FontAwesomeIcons.minus,
            color: Colors.grey,
            size: 30, // Adjust minus symbol size as needed
          ),
        ),
      ),
    );
  }
}