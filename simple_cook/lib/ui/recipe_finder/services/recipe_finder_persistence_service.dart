abstract class RecipeFinderPersistenceService {
  Future<void> addToSearchBox(String searchTerm);
  List<String> getSearchBox();
  Future<Iterable<String>> search(String query);
}