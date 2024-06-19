import 'package:flutter/material.dart';
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


    return Column(children: [
      Container(
        child: SearchAnchor.bar(
            barBackgroundColor: MaterialStateProperty.all(Colors.white),
            dividerColor: Colors.black,
            barHintText: "Suchen...",
            isFullScreen: false,
            //TODO: searchbar needs better color!
            viewBackgroundColor: SimpleCookColors.searchBar,
            suggestionsBuilder:
                (BuildContext context, SearchController controller) async {
              searchQuery = controller.text;
              final List<String> vegetables =
                  (await database.search(searchQuery!)).toList();

              return List<ListTile>.generate(vegetables.length, (int index) {
                final String item = vegetables[index];
                return ListTile(
                  title: Text(item),
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                      selectedTile = item;
                      //should return the recipes with the selected ingredient
                    });
                  },
                );
              });
            }),
      ),
    ]);
  }
}

class database {
  //should be updated to build connection to actual database
  static const List<String> _kOptions = <String>[
    'Tomaten',
    'Kartoffel',
    'Ei',
    'Karrotte',
    'Karrtr'
        'Kardfcgdfb'
        'Klöereasr'
        'Zwiebel',
    'Knoblauch',
    'Paprika',
    'Noah',
  ];

  static Future<Iterable<String>> search(String query) async {
    if (query == null || query.isEmpty) {
      return Iterable<String>.empty();
    }
    return _kOptions.where((String option) => option.contains(query));
  }
}
