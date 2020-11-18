import 'package:ejemplo_clean_architecture_tdd/feature/search/data/model/result_search_model.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/entities/result_search.dart';

abstract class SearchDatasource extends ResultSearch {
  Future<List<ResultSearchModel>> getSearch(String searchText);
}
