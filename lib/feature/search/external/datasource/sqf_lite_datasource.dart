import 'package:ejemplo_clean_architecture_tdd/feature/search/data/datasource/search_datasource.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/data/model/result_search_model.dart';

class SqfLiteDatasource implements SearchDatasource {
  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) {
    throw UnimplementedError();
  }
}
