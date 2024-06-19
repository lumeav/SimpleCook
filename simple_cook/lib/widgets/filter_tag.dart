import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';

class FilterTag extends StatefulWidget {
  final String text;

  const FilterTag(
    this.text, {
    super.key,
  });

  @override
  State<FilterTag> createState() => _FilterTagState();
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
                  backgroundColor: SimpleCookColors.primary.withOpacity(0.75),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(
                        color: SimpleCookColors.border, width: 1.5),
                  ),
                ),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                label: Text(
                  widget.text,
                  style: SimpleCookTextstyles.filterTagTapped,
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
                          color: SimpleCookColors.border,
                          width: 1.5)),
                ),
                child: Text(
                  widget.text,
                  style: SimpleCookTextstyles.filterTagUntapped,
                ),
              ));
  }
}
