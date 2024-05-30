import 'package:flutter/material.dart';

class ButtonHeart extends StatefulWidget {
  final bool border;

  const ButtonHeart(
    this.border, {
    Key? key,
  }) : super(key: key);

  @override
  _ButtonHeartState createState() => _ButtonHeartState();
}

class _ButtonHeartState extends State<ButtonHeart> {
  bool _pressed = false;

  void _onPressed() {
    setState(() {
      _pressed = !_pressed;
    });

    if (_pressed) {
      // Placeholder for future logic
    } else {
      // Placeholder for future logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: widget.border
          ? const ShapeDecoration(shape: CircleBorder(), color: Colors.white)
          : null,
      child: IconButton(
          onPressed: _onPressed,
          icon: Icon(_pressed ? Icons.favorite : Icons.favorite_border,
              color: Colors.orange.withOpacity(0.7), size: 32)),
    );
  }
}
