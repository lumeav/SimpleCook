import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_controller_implementation.dart';


class SearchBarFilter extends ConsumerStatefulWidget {
  const SearchBarFilter({super.key});

  @override
  ConsumerState<SearchBarFilter> createState() => _SearchBarState();
}

//TODO buttons are not deleted right

class _SearchBarState extends ConsumerState<SearchBarFilter> {
  String? searchQuery;
  String selectedTile = '';

  List<String> buttons = [];
  //last vegetables from db
  late Iterable<Widget> lastVegetables = <Widget>[];
  @override
  Widget build(BuildContext context) {
    final recipeFinderNotifier = ref.watch(recipeFinderControllerImplementationProvider.notifier);
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 10, bottom: 12, left : 15, right: 15),
        color: Colors.white,
        child: SearchAnchor.bar(
            barBackgroundColor: MaterialStateProperty.all(Colors.white),
            dividerColor: Colors.black,
            barHintText: "Lebensmittel...",
            isFullScreen: false,
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
                      controller.closeView("");
                      selectedTile = item;
                      buttons.add(selectedTile);
                      recipeFinderNotifier.setFilterActive(item);
                    });
                  },
                );
              });
            }),
      ),
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(left: 15),
        child: const Text(
          'Lebensmittel',
          style: SimpleCookTextstyles.header,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: 10.0, // gap between adjacent chips
          runSpacing: 5.0, // gap between lines
          children: List<Widget>.generate(buttons.length, (int index) {
            return Directionality(
                textDirection: TextDirection.rtl,
                child: InputChip(
                  label: Text(
                    buttons[index],
                    style: SimpleCookTextstyles.filterTagTapped,
                  ),
                  deleteIconColor: Colors.white,
                  backgroundColor: SimpleCookColors.primary.withOpacity(0.75),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onDeleted: () => setState(() {
                    recipeFinderNotifier.setFilterInactive(buttons[index]);
                    buttons.removeAt(index);
                  }),
                ));
          }).toList(),
        ),
      )
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
    'Kardfcgdfb'
    'Zwiebel',
    'Knoblauch',
    'Paprika',
    'Gurke',
    'Salat',
  ];

  static Future<Iterable<String>> search(String query) async {
    if (query == null || query.isEmpty) {
      return Iterable<String>.empty();
    }
    return _kOptions.where((String option) => option.contains(query));
  }
}
