import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;


  RoundedIconButton({
    required this.icon,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange,
      ),
      child: IconButton(
        icon: Icon(Icons.remove),
        iconSize: 10,
        color: Colors.black,
        onPressed: onPress as  void Function(),
      ),
    );
  }
}