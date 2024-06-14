import 'package:flutter/material.dart';
import 'package:simple_cook/common/common_view.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:go_router/go_router.dart';


class RecipesFoundView extends StatefulWidget {
  final Function(int) onItemTapped;

  const RecipesFoundView({
    Key? key,
    required this.onItemTapped
  }) : super(key: key);

  @override
  _RecipesFoundViewState createState() => _RecipesFoundViewState();
}

class _RecipesFoundViewState extends State<RecipesFoundView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          IconButton(
            icon: Icon(Icons.back_hand),
            color: Colors.black,
            iconSize: 40.0,
            onPressed: () {
              context.go('/search');
            },
          ),
          Text(
            'Rezepte gefunden xyz',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ]
      )
    );
  }
}

