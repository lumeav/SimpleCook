import 'package:flutter/material.dart';

//This is the "Rezepte Suchen" button that is orange with white letters

class SearchRecipesButton extends StatelessWidget {
  final String buttontext;

  const SearchRecipesButton(this.buttontext,{Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            // Placeholder for future logic
            //print("Button pressed");
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(
                    color: Color.fromARGB(255, 127, 127, 127), width: 1.5),
              ),
            ),
          ),
          child: Text(
            buttontext,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          )));
  }
}