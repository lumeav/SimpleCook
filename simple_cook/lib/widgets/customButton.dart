import 'package:flutter/material.dart';

// This is the customButton in the filter view (for example to enable/disable vegan food) that inverts its colors whenever it is pressed

class CustomButton extends StatefulWidget {
  final String text;
  final bool activated;
  final Function(bool) onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.activated,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPressed(!widget.activated);
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: _pressed || widget.activated ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _pressed || widget.activated ? Colors.transparent : Colors.orange,
            width: 2,
          ),
        ),
        child: _pressed ? Text(
          widget.text,
          style: TextStyle(
            color: _pressed || widget.activated ? Colors.white : Colors.orange,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ) : Text (
          "hello",
          style: TextStyle(
            color: _pressed || widget.activated ? Colors.white : Colors.orange,
            fontSize: 16,
            fontWeight: FontWeight.bold,
        ),
      ),
      )
    );
  }
}
