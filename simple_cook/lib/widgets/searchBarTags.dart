import 'package:flutter/material.dart';

class SearchBarTags extends StatefulWidget {
  final String tag;
  final double width;
  final double height;

  const SearchBarTags(this.tag, this.height, this.width, {Key? key})
      : super(key: key);

  @override
  _SearchBarTagsState createState() => _SearchBarTagsState();
}

//UNVOLLSTÄNDIG !!!!!
class _SearchBarTagsState extends State<SearchBarTags> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      //height: widget.height,
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: InputChip(
            label: Text(
              widget.tag,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            deleteIconColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 254, 189, 92),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onDeleted: () => setState(() {

            }),
          )),
    );
  }
}

