import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarExplore extends StatefulWidget {
  const SearchBarExplore({super.key});

  @override
  State<SearchBarExplore> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarExplore> {
  String? searchQuery;
  String selectedTile = '';

  @override
  Widget build(BuildContext context) {
    List<String> lastInput = <String>[];

    return Column(children: <Widget>[
      SearchAnchor.bar(
          barBackgroundColor: MaterialStateProperty.all(SimpleCookColors.secondary),
          dividerColor: Colors.black,
          barHintText: "Suchen...",
          isFullScreen: false,
          onSubmitted: (String value) {
            if (lastInput.contains(value) == false) {
              lastInput.add(value);
            }
            context.goNamed('subRecipesFiltered', queryParameters: <String, dynamic>{'search': value});
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
    ]);
  }
}

