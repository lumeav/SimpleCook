abstract class SearchPersistenceService {
  Future<void> addToSearchBox(String searchTerm);
  List<String> getSearchBox();
  Future<Iterable<String>> search(String query);
}
