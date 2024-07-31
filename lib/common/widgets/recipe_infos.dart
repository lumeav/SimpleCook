import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';

class RecipeInfos extends StatelessWidget {
  final String textTime;

  const RecipeInfos(
    this.textTime, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      direction: Axis.horizontal,
      spacing: 10.0,
      runSpacing: 5.0,
      children: <Widget>[
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
              padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 4.0),
              decoration: BoxDecoration(
                  color: SimpleCookColors.primary.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Icon(Icons.access_time, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    '$textTime min',
                    style: SimpleCookTextstyles.recInfos,
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
