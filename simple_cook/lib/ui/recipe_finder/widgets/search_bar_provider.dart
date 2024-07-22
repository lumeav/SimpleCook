import 'package:simple_cook/service/persistence_service/persistence_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarNotifier extends StateNotifier<List<String>> {
  SearchBarNotifier() : super([]) {
    loadSearchBox();
  }

  final PersistenceService _persistenceService = PersistenceService();

  Future<void> loadSearchBox() async {
    final searchHistory = await _persistenceService.getSearchBox();
    state = searchHistory;
  }

  Future<void> addSearchQuery(String query) async {
    final updatedHistory = [...state, query];
    await _persistenceService.addToSearchBox(query);
    state = updatedHistory;
  }

  Future<Iterable<String>> search(String query) async {
    return await _persistenceService.search(query);
  }
}

final searchBarProvider = StateNotifierProvider<SearchBarNotifier, List<String>>((ref) {
  return SearchBarNotifier();
});