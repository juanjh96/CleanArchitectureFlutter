import 'package:dartz/dartz.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/entities/result_search.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/errors/errors.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/repositories/Search_repository.dart';

abstract class SearchByText {
  Future<Either<SearchError, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository searchRepository;

  SearchByTextImpl(this.searchRepository);

  @override
  Future<Either<SearchError, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText == '') {
      return Left(InvalidTextError());
    }
    return searchRepository.search(searchText);
  }
}
