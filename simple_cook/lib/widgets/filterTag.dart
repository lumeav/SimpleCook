import 'package:flutter/material.dart';

class FilterTag extends StatefulWidget {
  final String text;

  const FilterTag(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  _FilterTagState createState() => _FilterTagState();
}

class _FilterTagState extends State<FilterTag> {
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
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: _pressed
            ? ElevatedButton.icon(
                onPressed: _onPressed,
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: const Color(0xffFF9F5A).withOpacity(0.75),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 127, 127, 127), width: 1.5),
                  ),
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
            : ElevatedButton(
                onPressed: _onPressed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 127, 127, 127),
                          width: 1.5)),
                ),
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    color: Color(0xffFF9F5A),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ));
  }
}
