class SearchQuery {
  final String lang;
  final int page;
  final String query;
  final bool includeAdult;

  SearchQuery(
      {required this.lang,
      required this.page,
      required this.query,
      this.includeAdult = false});
}
