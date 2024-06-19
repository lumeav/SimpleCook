import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';

class HeartButton extends StatefulWidget {
  final bool border;

  const HeartButton(
    this.border,{
    super.key,
  });

  @override
  State<HeartButton> createState() => _HeartButtonState();
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
    var size = MediaQuery.of(context).size.width * 0.07;
    if (!widget.border) {
      size = size + 22;
    }
    return Container(
      width: size + 8,
      height:  size + 8,
      decoration: widget.border
          ? const BoxDecoration(shape: BoxShape.circle, color: Colors.white)
          : null,
      child: IconButton(
          onPressed: _onPressed,
          padding: EdgeInsets.zero,
          icon: Icon(_pressed ? Icons.favorite : Icons.favorite_border,
              color: SimpleCookColors.primary, size: size )),
    );
  }
}
