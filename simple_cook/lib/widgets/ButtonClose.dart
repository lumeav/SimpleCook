import 'package:flutter/material.dart';

class ButtonClose extends StatelessWidget {
  const ButtonClose({Key? key}) : super(key: key);

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
