abstract class SearchError implements Exception {}

class InvalidTextError implements SearchError {}

class DataSourceError implements SearchError {
  DataSourceError({this.message});

  final String message;
}
