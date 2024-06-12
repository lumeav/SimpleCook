import 'package:flutter/material.dart';
import 'package:simple_cook/common/common_view.dart';
import 'package:simple_cook/common/navbar.dart';
import 'package:simple_cook/widgets/rezeptdesTages.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:simple_cook/widgets/greyBackground.dart';
import 'package:simple_cook/widgets/singleRecipeButton.dart';

class FavoritesView extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const FavoritesView({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
      body: GreyBackground([
        Text(
          'Favoriten',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
        SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
        SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
        SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
        SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
        SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
        SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen')
      ]),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: widget.selectedIndex,
        onItemTapped: widget.onItemTapped,
      ),
    );
  }
}
