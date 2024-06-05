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
              color: Colors.orange,
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
          Text("Zubereitung", style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 12.0),
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: steps.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _buildStep(steps[index], index),
                  if (index < steps.length - 1)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(),
                    )
                ],
              );
            },
          ))
        ]));
  }
}
