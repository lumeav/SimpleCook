import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/common/theme.dart';

//This is the "Rezepte Suchen" button that is orange with white letters

class SearchRecipesButton extends StatelessWidget {
  final String buttontext;
  final String viewName;

  const SearchRecipesButton(this.buttontext, this.viewName, {super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
            onPressed: () {
              context.goNamed(viewName);
            //TODO!!!: Add functionality to navigate to the recipeFinder page

          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(SimpleCookColors.primary),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(
                    color: SimpleCookColors.border, width: 1.5),
              ),
            ),
          ),
          child: Text(
            buttontext,
            style: SimpleCookTextstyles.filterTagTapped,
          )));
  }
}
