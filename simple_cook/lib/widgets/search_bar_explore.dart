import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/common/theme.dart';

class SearchBarExplore extends StatefulWidget {
  const SearchBarExplore({super.key});

  @override
  State<SearchBarExplore> createState() => _SearchBarState();
}

//TODO buttons are not deleted right

class _SearchBarState extends State<SearchBarExplore> {
  String? searchQuery;
  String selectedTile = '';


  //last vegetables from db


  @override
  Widget build(BuildContext context) {
    List<String> lastInput = [];

    return Column(children: [
      Container(
        child: SearchAnchor.bar(
            barBackgroundColor: MaterialStateProperty.all(Colors.white),
            dividerColor: Colors.black,
            barHintText: "Suchen...",
            isFullScreen: false,
            onSubmitted: (value) {
              if (lastInput.contains(value) == false) {
                lastInput.add(value);
              }
              context.goNamed('subRecipesFiltered', queryParameters: {'search': value});
            }
            ,
            viewBackgroundColor: SimpleCookColors.searchBar,
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(lastInput.length, (int index) {
                final String item = lastInput[index];
                return ListTile(
                  title: Text(item),
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                      selectedTile = item;
                    });
                  },
                );

              });
            }),
      ),
    ]);
  }
}

