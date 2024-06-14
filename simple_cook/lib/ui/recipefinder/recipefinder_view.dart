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
        body: Container(
          child: Scrollbar(
            radius: Radius.circular(50),
            thickness: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SearchBarFilter(),
                  _buildFilterHeader("Kategorie"),
                  _buildFilterTags(kategorieList),
                  _buildFilterHeader("Ernährungsart"),
                  _buildFilterTags(ernaehrungsartList),
                  _buildFilterHeader("Ernährungsart"),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: SliderFilter(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    alignment: Alignment.center,
                    child: SearchRecipesButton("Rezepte suchen")),

                ],
              ),
            ),
          ),
        ));
  }

  List<String> kategorieList = [
    'Alle',
    'Vorspeise',
    'Hauptspeise',
    'Dessert',
    'Snacks',
  ];

  List<String> ernaehrungsartList = [
    'Vegetarisch',
    'Vegan',
    'Glutenfrei',
    'Laktosefrei',
    'Low Carb',
  ];
  //maybe refactor methods to widgets

  Widget _buildFilterHeader(String header) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 10),
          child: Text(
            header,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget _buildFilterTags(List<String> filterList) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Wrap(
            alignment: WrapAlignment.start,
            //crossAxisAlignment: WrapCrossAlignment.end,
            runAlignment: WrapAlignment.start,
            direction: Axis.horizontal,
            spacing: 10.0, // Space between tags
            runSpacing: 5.0, // Space between lines
            children: [
              for (var filter in filterList) FilterTag(filter),
            ],
          )),
    );
  }
}


