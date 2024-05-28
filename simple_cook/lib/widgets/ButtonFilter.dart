import 'package:flutter/material.dart';

class ButtonFilter extends StatefulWidget {
  final String text;
  final double width;
  final double height;


  const ButtonFilter({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _ButtonFilterState createState() => _ButtonFilterState();
}

class _ButtonFilterState extends State<ButtonFilter> {
  bool _pressed = false;

  void _onPressed() {
    setState(() {
      _pressed = !_pressed;
    });
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: _pressed
      ? ElevatedButton(
        onPressed: _onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: const BorderSide(
                color: Color.fromARGB(255, 127, 127, 127),
                width: 1.5),
            ),
          ),
          elevation: MaterialStateProperty.all(3),
          overlayColor: MaterialStateProperty.all<Color>(Colors.orange.withOpacity(0.3)),
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.orange,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
      : ElevatedButton.icon(
        onPressed: _onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.withOpacity(0.7)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: const BorderSide(
                color: Color.fromARGB(255, 127, 127, 127),
                width: 1.5),
            ),
          ),
          elevation: MaterialStateProperty.all(3),
          overlayColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 229, 222, 211).withOpacity(0.3)),

        ),
        icon: const Icon(
          Icons.close,
          color: Colors.white,
          size: 20.0,
        ),
        label: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        )
    );
  }

}


