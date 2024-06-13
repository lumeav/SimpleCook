import 'package:flutter/material.dart';
import 'package:simple_cook/common/navbar.dart';
import 'package:simple_cook/widgets/greyBackground.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:simple_cook/widgets/whitePlaceholder.dart';
import 'package:simple_cook/widgets/filterTag.dart';
import 'package:simple_cook/widgets/sliderFilter.dart';
import 'package:simple_cook/widgets/searchBar.dart';
import 'package:simple_cook/widgets/searchRecipeButton.dart';

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
      body: GreyBackground(
        [
          Stack(
            children: [
              WhitePlaceholder(85),
              Align(alignment: Alignment.center, child: SearchBarFilter()),
            ],
          ),
          Text(
            'Kategorie',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Wrap(
            spacing: 10.0, // Space between tags
            runSpacing: 8.0, // Space between lines
            children: [
              FilterTag(
                'Alle',
                50,
                100,
              ), // Space between the FilterTags
              FilterTag(
                'Vorspeise',
                50,
                145,
              ),
              FilterTag(
                'Hauptspeise',
                50,
                160,
              ),
              FilterTag(
                'Dessert',
                50,
                135,
              ),
              FilterTag(
                'Snacks',
                50,
                135,
              ),
            ],
          ),
          Text(
            'Ernährungsart',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Wrap(
            spacing: 10.0, // Space between tags
            runSpacing: 8.0, // Space between lines
            children: [
              FilterTag(
                'Vegetarisch',
                50,
                170,
              ),
              FilterTag(
                'Vegan',
                50,
                140,
              ),
              FilterTag(
                'Glutenfrei',
                50,
                160,
              ),
              FilterTag(
                'Laktosefrei',
                50,
                170,
              ),
              FilterTag(
                'Low Carb',
                50,
                150,
              ),
            ],
          ),
          Text(
            'Zubereitungszeit',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(child: SliderFilter()),
          Center(child: SearchRecipesButton("Rezepte suchen"))
        ],
      ),
    );
  }
}
