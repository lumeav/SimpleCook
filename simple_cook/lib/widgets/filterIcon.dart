import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          // Placeholder for future logic
          //print("Filter Icon pressed");
        },
        icon: const FaIcon(
          FontAwesomeIcons.sliders,
          color: Colors.grey,
          size: 40,));
  }
}
