import 'package:flutter/material.dart';

class Preparation extends StatelessWidget {
  final List<String> steps;

  const Preparation(this.steps, {Key? key}) : super(key: key);

  Widget _buildStep(String text, int index) {
    index++;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 30.0,
            height: 30.0,
            decoration: const BoxDecoration(
              color: Color(0xffFF9F5A),
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Text('$index',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )))),
        SizedBox(width: 16.0),
        Expanded(child: Text(text, style: TextStyle(fontSize: 18))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Zubereitung", style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: List.generate(steps.length * 2 - 1, (index) {
                if (index.isEven) {
                  // Even indices are step items
                  int stepIndex = index ~/ 2;
                  return _buildStep(steps[stepIndex], stepIndex);
                } else {
                  // Odd indices are dividers
                  return Padding(
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
