import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.12;
    return IconButton(
        onPressed: () {
          // Placeholder for future logic
        },
        icon: Icon(
          Icons.close_outlined,
          color: Colors.grey,
          size: size));
  }
}
