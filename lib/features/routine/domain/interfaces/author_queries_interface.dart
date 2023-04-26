abstract class AuthorQueriesInterface {
  Future<bool> checkIfAuthorExist(String authorID);
  Future<List<Map<String, Object?>>> getAuthorById(String authorID);
  Future<List<Map<String, Object?>>> getCachedAuthor(String userID);
}
