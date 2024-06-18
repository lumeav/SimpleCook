import 'package:flutter/material.dart';
import 'package:simple_cook/common/common_view.dart';
import 'package:simple_cook/common/navbar.dart';
import 'package:simple_cook/mein.dart';
import 'package:simple_cook/widgets/headerRezeptdesTages.dart';
import 'package:simple_cook/widgets/extendedRecipe.dart';
import 'package:simple_cook/widgets/searchBarExplore.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:simple_cook/widgets/simpleRecipe.dart';
import 'package:simple_cook/widgets/searchBar.dart';
import 'package:simple_cook/widgets/filterButton.dart';
import 'package:simple_cook/widgets/headerGreyBackground.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_cook/widgets/filterTag.dart';
import 'package:simple_cook/widgets/sliderFilter.dart';
import 'package:simple_cook/widgets/searchRecipeButton.dart';

class ExploreView extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const ExploreView({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            toolbarHeight: 80,
            title: Container(
              //color: Colors.white,
              child: Row(children: [
                Expanded(child: SearchBarExplore()),
                IconButton(
                    onPressed: () => buildBottomSheetFilter(context),
                    icon: const FaIcon(FontAwesomeIcons.sliders,
                        color: Colors.grey, size: 28)),
              ]),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10.0, bottom: 10.0),
                  child: ExtendedRecipe('assets/flammkuchen.jpg',
                      HeaderRezeptDesTages('Flammmkuchen')),
                ),
                HeaderGreyBackground('Entdecke neue Rezepte', FontWeight.w300),
                ..._buildRowsRecipe(_buildRecipeWidgets()),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: widget.selectedIndex,
        onItemTapped: widget.onItemTapped,
      ),
    );
  }

  void buildBottomSheetFilter(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.grey[200],
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.85,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderGreyBackground("Kategorie", FontWeight.bold),
                  _buildFilterTags(kategorieList),
                  HeaderGreyBackground("Ernährungsart",
                      FontWeight.bold), // HeaderGreyBackground("Ernährungsart"
                  _buildFilterTags(ernaehrungsartList),
                  HeaderGreyBackground("Zubereitungszeit", FontWeight.bold),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: SliderFilter(),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 50, bottom: 30),
                      alignment: Alignment.center,
                      child: SearchRecipesButton("Rezepte suchen")),
                ],
              ),
            ),
          );
        });
  }

  List<Widget> _buildRecipeWidgets() {
    List<Widget> recipeWidgets = [];
    for (int i = 0; i < 10; i++) {
      recipeWidgets.add(
        SimpleRecipe('assets/flammkuchen.jpg',
            'Flammkuchen hello das ist ein langer text'),
      );
    }
    return recipeWidgets;
  }

  List<Widget> _buildRowsRecipe(List<Widget> recipeWidgets) {
    List<Widget> reciperows = [];
    for (int i = 0; i < recipeWidgets.length; i++) {
      reciperows.add(
        Padding(
          padding: const EdgeInsets.only(
              left: 15, right: 15, top: 10.0, bottom: 10.0),
          child: Row(
            children: [
              Expanded(flex: 2, child: recipeWidgets[i]),
              SizedBox(width: 10), // Add some spacing between the buttons
              Expanded(flex: 2, child: recipeWidgets[i + 1]),
            ],
          ),
        ),
      );
      i++;
    }
    return reciperows;
  }
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
