import 'package:dartz/dartz.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/entities/result_search.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/errors/errors.dart';

// ignore: one_member_abstracts
abstract class SearchRepository {
  Future<Either<SearchError, List<ResultSearch>>> search(String searchText);
}
