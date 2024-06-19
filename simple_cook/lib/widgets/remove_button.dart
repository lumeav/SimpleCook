import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 3,

        )
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Placeholder for future logic
          },
          icon: const FaIcon(
            FontAwesomeIcons.minus,
            color: Colors.grey,
            size: 20,
          ),
        ),
      ),
    );
  }
}