import 'package:flutter/material.dart';
import 'package:simple_cook/common/common_view.dart';

class FavoritesView extends StatelessWidget {

  final int selectedIndex;
  final Function(int) onItemTapped;

  const FavoritesView({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CommonView(
      selectedIndex: selectedIndex,
      onItemTapped: onItemTapped,
      child: Center(
        child: Text('Favorites View'),
      ),
    );
  }
}