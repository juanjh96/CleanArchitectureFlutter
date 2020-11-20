import 'package:dartz/dartz.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/entities/result_search.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/errors/errors.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/repositories/Search_repository.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/usecases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

// ignore: always_declare_return_types
main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test(
    'Debe retornar una lista de Resultados',
    () async {
      when(repository.search(any))
          .thenAnswer((_) async => Right(<ResultSearch>[]));
      final result = await usecase('2');
      expect(
        result | null,
        isA<List<ResultSearch>>(),
      );
    },
  );

  test(
    'Debe retornar un InvalidTextError, si el texto es invalido',
    () async {
      when(repository.search(any))
          .thenAnswer((_) async => Right(<ResultSearch>[]));
      var result = await usecase(null);
      expect(result.fold(id, id), isA<InvalidTextError>());
      result = await usecase('');
      expect(result.fold(id, id), isA<InvalidTextError>());
    },
  );
}
