import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';

class Preparation extends StatelessWidget {
  final List<String> steps;

  const Preparation(this.steps, {super.key});

  Widget _buildStep(String text, int index) {
    index++;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            width: 30.0,
            height: 30.0,
            decoration: const BoxDecoration(
              color: SimpleCookColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Text('$index',
                    style: SimpleCookTextstyles.steps))),
        const SizedBox(width: 16.0),
        Expanded(child: Text(text, style: SimpleCookTextstyles.rawText)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          const Text("Zubereitung", style: SimpleCookTextstyles.subheader),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: List<Widget>.generate(steps.length * 2 - 1, (int index) {
                if (index.isEven) {
                  int stepIndex = index ~/ 2;
                  return _buildStep(steps[stepIndex], stepIndex);
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  );
                }
              }),
            ),
          )
        ]));
  }
}
