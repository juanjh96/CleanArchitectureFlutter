import 'package:ejemplo_clean_architecture_tdd/feature/search/data/datasource/search_datasource.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/errors/errors.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/repositories/Search_repository.dart';

class SearchRepositoryimpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryimpl(this.datasource);

  @override
  Future<Either<SearchError, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    }
  }
}
