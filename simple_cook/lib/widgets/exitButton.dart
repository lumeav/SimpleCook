import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          // Placeholder for future logic
          //print("Filter Icon pressed");
        },
        icon: const Icon(
          Icons.close_outlined,
          color: Colors.grey,
          size: 40,));
  }
}
