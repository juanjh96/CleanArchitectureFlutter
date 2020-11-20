import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/errors/errors.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/external/datasource/dio_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../utils/reqres_response.dart';

class HttpMock extends Mock implements Dio {}

void main() {
  final dio = HttpMock();
  final datasource = DioDataSource(dio);
  test('Debe retornar una lista de Resultados si el codigo de respuesta es 200',
      () {
    when(dio.get(any)).thenAnswer(
      (_) async => Response(data: jsonDecode(reqresResult), statusCode: 200),
    );
    final future = datasource.getSearch('2');
    expect(future, completes);
  });

  test('Debe retornar un DatasourceError, si el codigo de respuesta no es 200',
      () {
    when(dio.get(any)).thenAnswer(
      (_) async => Response(data: null, statusCode: 401),
    );
    final future = datasource.getSearch('2');
    expect(future, throwsA(isA<DataSourceError>()));
  });
}
