import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_cook/common/theme.dart';

class RecipeInfos extends StatelessWidget {
  final String text_time;
  final String text_dif;

  const RecipeInfos(
    this.text_time,
    this.text_dif, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      direction: Axis.horizontal,
      spacing: 10.0, // Space between tags
      runSpacing: 5.0, // Space between lines
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
              padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 4.0),
              decoration: BoxDecoration(
                  color: SimpleCookColors.primary.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.access_time, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    text_time + ' min',
                    style: SimpleCookTextstyles.recInfos,
                  ),
                ],
              )),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
              padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 4.0),
              decoration: BoxDecoration(
                  color: SimpleCookColors.primary.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.bar_chart_rounded, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    text_dif,
                    style: SimpleCookTextstyles.recInfos,
                  ),
                ],
              )),
        )
      ],
    );
  }
}
