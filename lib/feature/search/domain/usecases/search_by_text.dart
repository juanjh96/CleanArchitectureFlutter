import 'package:dartz/dartz.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/entities/result_search.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/errors/errors.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/repositories/Search_repository.dart';

// ignore: one_member_abstracts
abstract class SearchByText {
  Future<Either<SearchError, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  SearchByTextImpl(this.searchRepository);
  final SearchRepository searchRepository;

  @override
  Future<Either<SearchError, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText == '') {
      return Left(InvalidTextError());
    }
    return searchRepository.search(searchText);
  }
}
