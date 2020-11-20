import 'package:dio/dio.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/data/datasource/search_datasource.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/data/model/result_search_model.dart';
import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/errors/errors.dart';

class DioDataSource implements SearchDatasource {
  DioDataSource(this.dioClient);

  final Dio dioClient;

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response =
        await dioClient.get('https://reqres.in/api/users/$searchText');
    if (response.statusCode == 200) {
      final list = (response.data['data'] as List)
          .map(
            (e) => ResultSearchModel.fromMap(e),
          )
          .toList();
      return list;
    } else {
      throw DataSourceError(message: 'Mensaje de error desde el backend');
    }
  }
}
