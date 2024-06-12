import 'package:flutter/material.dart';
import 'package:simple_cook/common/navbar.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:simple_cook/widgets/whitePlaceholder.dart';
import 'package:simple_cook/widgets/filterTag.dart';
import 'package:simple_cook/widgets/sliderFilter.dart';
import 'package:simple_cook/widgets/searchBar.dart';
//import 'package:simple_cook/widgets/singleRecipeButton.dart';

class RecipefinderView extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  RecipefinderView({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _RecipefinderViewState createState() => _RecipefinderViewState();
}
// TODO: filterTags don't grow bigger with more characters. "Hauptspeise" is too long for the button. Make it so that it dynamically grows bigger horizontally.
// TODO: Make it so that the buttons dont go out the screen. So far only two buttons added because a third one would go outside the screen.

class _RecipefinderViewState extends State<RecipefinderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(
        selectedIndex: widget.selectedIndex,
        onItemTapped: widget.onItemTapped,
      ),
      appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the start (left)
        children: [
          Stack(
            children: [
              WhitePlaceholder(85),
              Align(alignment: Alignment.center, child: SearchBarFilter()),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Lebensmittel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                FilterTag(
                  'Karotte',
                  50,
                  150,
                ),
                SizedBox(width: 10), // Space between the FilterTags
                FilterTag(
                  'Tomate',
                  50,
                  150,
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Kategorie',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                FilterTag(
                  'Alle',
                  50,
                  150,
                ),
                SizedBox(width: 10), // Space between the FilterTags
                FilterTag(
                  'Vorspeise',
                  50,
                  150,
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ernährungsart',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                FilterTag(
                  'Vegetarisch',
                  50,
                  150,
                ),
                SizedBox(width: 10), // Space between the FilterTags
                FilterTag(
                  'Vegan',
                  50,
                  150,
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Zubereitungszeit',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(child: SliderFilter())
        ],
      ),
    );
  }
}
