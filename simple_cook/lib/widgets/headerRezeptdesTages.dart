import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';

class HeaderRezeptDesTages extends StatelessWidget {
  final String title;

  const HeaderRezeptDesTages(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 15),
      child: Column(children: [
        const Text('Rezept des Tages',
            style: SimpleCookTextstyles.rezeptDesTages),
        Text(title,
            style: SimpleCookTextstyles.header)
      ]),
    );
  }
}
