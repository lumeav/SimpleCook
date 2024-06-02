import 'package:flutter/material.dart';

class GreyBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
            ),
            child: Container(
              color: Colors.grey[200], // Light grey background color
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This is a scrollable area with a grey background.',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  // Add more widgets Here !!!!!!!!!!!!!! ToDo
                  for (int i = 0;
                      i < 50;
                      i++) // Increase the number of items to ensure scrolling
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Item $i', style: TextStyle(fontSize: 18)),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
