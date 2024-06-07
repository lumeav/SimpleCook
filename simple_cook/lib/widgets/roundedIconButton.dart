import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function onPress;



  RoundedIconButton({
    required this.size,
    required this.icon,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: size + 3,
      height: size + 3,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffFF9F5A),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon),
        iconSize: size,
        color: Colors.white,
        onPressed: onPress as  void Function(),
      ),
    );
  }
}