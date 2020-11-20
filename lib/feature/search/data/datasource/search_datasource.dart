import 'package:ejemplo_clean_architecture_tdd/feature/search/data/model/result_search_model.dart';

// ignore: one_member_abstracts
abstract class SearchDatasource {
  Future<List<ResultSearchModel>> getSearch(String searchText);
}
