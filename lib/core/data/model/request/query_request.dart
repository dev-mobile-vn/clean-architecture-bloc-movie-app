class QueryRequest {
  final String lang;
  final int page;
  final String path;
  final String id;

  QueryRequest(this.lang, this.page, [this.path = "", this.id = ""]);
}
