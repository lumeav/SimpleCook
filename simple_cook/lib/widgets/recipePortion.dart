import 'dart:ffi';

import 'package:flutter/material.dart';

class RecipePortion extends StatefulWidget {

  const RecipePortion({Key? key}) : super(key: key);

  @override
  _RecipePortionState createState() => _RecipePortionState();
}

class _RecipePortionState extends State<RecipePortion> {
  int portionSize = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconBut(
            onPressed: () {
              setState(() {
                portionSize++;
              });
            },
            icon: Icon(Icons.h_plus_mobiledata)
          ),
          Text(
            '${portionSize} Port.',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
