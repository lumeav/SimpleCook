import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  final bool border;
  final double size;

  const HeartButton(
    this.border,
    this.size, {
    Key? key,
  }) : super(key: key);

  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
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
    return Container(
      width: widget.size + 8,
      height: widget.size + 8,
      decoration: widget.border
          ? const BoxDecoration(shape: BoxShape.circle, color: Colors.white)
          : null,
      child: IconButton(
          onPressed: _onPressed,
          padding: EdgeInsets.zero,
          icon: Icon(_pressed ? Icons.favorite : Icons.favorite_border,
              color: Color(0xffFF9F5A), size: widget.size)),
    );
  }
}
