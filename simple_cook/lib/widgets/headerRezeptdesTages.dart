import 'package:flutter/material.dart';

class HeaderRezeptDesTages extends StatelessWidget {
  final String title;

  const HeaderRezeptDesTages(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 15),
      child: Column(children: [
        Text('Rezept des Tages',
            style: TextStyle(color: Color(0xffFF9F5A), fontSize: 18)),
        Text(title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24))
      ]),
    );
  }
}
