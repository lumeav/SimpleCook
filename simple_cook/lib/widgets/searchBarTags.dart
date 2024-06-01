import 'package:flutter/material.dart';

class SearchBarTags extends StatefulWidget {

  final String tag;
  final double width;
  final double height;

  const SearchBarTags(this.tag, this.height, this.width, {Key? key}) : super(key: key);

  @override
  _SearchBarTagsState createState() => _SearchBarTagsState();
}

class _SearchBarTagsState extends State<SearchBarTags> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return _isVisible ?
    SizedBox(
      child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _isVisible = false;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.orange.withOpacity(0.7)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 127, 127, 127),
                          width: 1.5),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(3),
                  overlayColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 229, 222, 211)
                          .withOpacity(0.3)),
                ),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 17.0,
                ),
                label: Text(
                  widget.tag,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )

    )
    : Container();
  }
}