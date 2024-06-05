import 'package:flutter/material.dart';

class RecipeInfos extends StatelessWidget {
  final String text_time;
  final String text_dif;

  const RecipeInfos(
    this.text_time,
    this.text_dif, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              decoration: BoxDecoration(
                  color: Color(0xffFF9F5A).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ]),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.grey),
                  const SizedBox(width: 4.0),
                  Text(
                    this.text_time,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
          const SizedBox(width: 10.0), // spacing between the two elements
          Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              decoration: BoxDecoration(
                  color: Color(0xffFF9F5A).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ]),
              child: Row(
                children: [
                  const Icon(Icons.bar_chart_rounded, color: Colors.grey),
                  const SizedBox(width: 2.0),
                  Text(
                    this.text_dif,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
