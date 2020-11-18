import 'package:dartz/dartz.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/data/datasource/search_datasource.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/data/model/result_search_model.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/data/repositories/search_repository_impl.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/entities/result_search.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/errors/errors.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchDatasource {}

main() {
  final datasource = SearchRepositoryMock();
  final repository = SearchRepositoryimpl(datasource);

  test(
    'debe retornar una lista de resultSearch',
    () async {
      when(datasource.getSearch(any))
          .thenAnswer((_) async => <ResultSearchModel>[]);
      final result = await repository.search('Juan');
      expect(result | null, isA<List<ResultSearch>>());
    },
  );

  test(
    'debe retornar un DataSourceError si datasource falla',
    () async {
      when(datasource.getSearch(any)).thenThrow(DataSourceError());

      final result = await repository.search('Juan');

      expect(result.fold(id, id), isA<DataSourceError>());
    },
  );
}
