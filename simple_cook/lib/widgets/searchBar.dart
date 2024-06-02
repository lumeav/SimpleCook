import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/searchBarTags.dart';
class SearchBarFilter extends StatefulWidget {
  const SearchBarFilter({Key? key}) : super(key: key);

  @override
  State<SearchBarFilter> createState() => _SearchBarState();
}

//TODO buttons are not deleted right

class _SearchBarState extends State<SearchBarFilter> {
  String? searchQuery;
  String selectedTile = '';

  List<Widget> buttons = [];
  //last vegetables from db
  late Iterable<Widget> lastVegetables = <Widget>[];
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          width: 300,
          height: 50,
          child: SearchAnchor.bar(
              barHintText: "Rezeptfinder...",
              isFullScreen: false,
              viewConstraints: const BoxConstraints(
                minHeight: 100,
              ),
              viewBackgroundColor: const Color.fromARGB(255, 249, 201, 129),
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
                        controller.closeView("");
                        selectedTile = item;
                        buttons.add(
                          SearchBarTags(selectedTile,35, 130)
                        );

                      });
                    },
                  );
                });
              }),
        ),
        Container(
          width: 300,
          height: 50,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: buttons
            ),
        )
      ]
    );
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