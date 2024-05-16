import 'package:flutter/material.dart';

class SearchRecipesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Placeholder for future logic
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Text("Rezepte Suchen"),
    );
  }
}