import 'package:flutter/material.dart';
import 'package:simple_cook/common/common_view.dart';
import 'package:simple_cook/common/navbar.dart';
import 'package:simple_cook/mein.dart';
import 'package:simple_cook/widgets/rezeptdesTages.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:simple_cook/widgets/greyBackground.dart';
import 'package:simple_cook/widgets/singleRecipeButton.dart';
import 'package:simple_cook/widgets/searchBar.dart';
import 'package:simple_cook/widgets/filterButton.dart';

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
      body: Column(
        children: [
          Row(children: [
            SearchBar(),
            FilterButton()
          ]),
          GreyBackground([
            RezeptDesTages('assets/tinga-de-pollo.jpg', 'Tinga de Pollo'),
            SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
            SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
            SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
            SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
            SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
            SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
            SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen')
          ]),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: widget.selectedIndex,
        onItemTapped: widget.onItemTapped,
      ),
    );
  }
}
