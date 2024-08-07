import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_providers.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_view.dart';


class SearchBarFilter extends ConsumerStatefulWidget {
  const SearchBarFilter({super.key});

  @override
  ConsumerState<SearchBarFilter> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBarFilter> {
  String? searchQuery;
  String selectedTile = '';

  List<String> buttons = <String>[];
  late Iterable<Widget> lastVegetables = <Widget>[];
  @override
  Widget build(BuildContext context) {
    final RecipeFinderController recipeFinderController = ref.watch(recipeFinderControllerProvider);
    return Column(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 10, bottom: 12, left : 15, right: 15),
        color: SimpleCookColors.secondary,
        child: SearchAnchor.bar(
            barBackgroundColor: MaterialStateProperty.all(SimpleCookColors.secondary),
            dividerColor: Colors.black,
            barHintText: "Lebensmittel...",
            isFullScreen: false,
            viewBackgroundColor: SimpleCookColors.searchBar,
            suggestionsBuilder:
                (BuildContext context, SearchController controller) async {
              searchQuery = controller.text;
              final List<String> vegetables =
                  (await recipeFinderController.search(searchQuery!)).toList();
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
                      recipeFinderController.setFilterActive(item);
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
          spacing: 10.0,
          runSpacing: 5.0,
          children: List<Widget>.generate(buttons.length, (int index) {
            return Directionality(
                textDirection: TextDirection.rtl,
                child: InputChip(
                  label: Text(
                    buttons[index],
                    style: SimpleCookTextstyles.filterTagTapped,
                  ),
                  deleteIconColor: SimpleCookColors.secondary,
                  backgroundColor: SimpleCookColors.primary.withOpacity(0.75),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onDeleted: () => setState(() {
                    recipeFinderController.setFilterInactive(buttons[index]);
                    buttons.removeAt(index);
                  }),
                ));
          }).toList(),
        ),
      )
    ]);
  }
}