// import 'package:simple_cook/service/persistence_service/persistence_service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:simple_cook/ui/recipe_finder/services/recipe_finder_persistence_service.dart';

// class SearchBarNotifier extends StateNotifier<List<String>> {

//   final SearchPersistenceService _searchService;

//   SearchBarNotifier(this._searchService) : super([]) {
//     loadSearchBox();
//   }

//   Future<void> loadSearchBox() async {
//     final searchHistory = await _searchService.getSearchBox();
//     state = searchHistory;
//   }

//   Future<void> addSearchQuery(String query) async {
//     final updatedHistory = [...state, query];
//     await _searchService.addToSearchBox(query);
//     state = updatedHistory;
//   }

//   Future<Iterable<String>> search(String query) async {
//     return await _searchService.search(query);
//   }
// }

// final searchBarProvider = StateNotifierProvider<SearchBarNotifier, List<String>>((ref) {
//   final SearchPersistenceService searchService = PersistenceService();
//   return SearchBarNotifier(searchService);
// });