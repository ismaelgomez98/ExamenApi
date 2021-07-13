// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:exame_api/src/models/cerveza_models.dart';

class CervezaProvider {
  final _url =
      'https://api.punkapi.com/v2/beers?brewed_before=11-2012&abv_gt=6';
  final _http = Dio();

  Future<List<CervezaModels>> obtenerCervezas(int pagina) async {
    final response = await _http.get(_url);
    List<dynamic> data = response.data;
    return data
        .map((cerveza) => CervezaModels.transformarInstancia(cerveza))
        .toList();
  }
}
