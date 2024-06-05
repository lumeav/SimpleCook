import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/RezeptdesTages.dart';

class GreyBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scrollbar(
          radius: Radius.circular(50),
          thickness: 5,
          child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                ),
                child: Container(// Light grey background color
                  padding: EdgeInsets.all(16.0),
                  //color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This is a scrollable area with a grey background.',
                        style: TextStyle(fontSize: 24),
                      ),
                      RezeptdesTages('assets/spaghetti-bolognese.jpg', 'Spaghetti Bolognese'),
                      RezeptdesTages('assets/spaghetti-bolognese.jpg', 'Spaghetti Bolognese'),
                      RezeptdesTages('assets/spaghetti-bolognese.jpg', 'Spaghetti Bolognese'),
                      RezeptdesTages('assets/spaghetti-bolognese.jpg', 'Spaghetti Bolognese'),
                      RezeptdesTages('assets/spaghetti-bolognese.jpg', 'Spaghetti Bolognese'),
                      RezeptdesTages('assets/spaghetti-bolognese.jpg', 'Spaghetti Bolognese'),
                      RezeptdesTages('assets/spaghetti-bolognese.jpg', 'Spaghetti Bolognese')


                      // Add more widgets Here !!!!!!!!!!!!!! ToDo

                    ],
                  ),
                ),
              ),
            )
        );
      },
    );
  }
}
