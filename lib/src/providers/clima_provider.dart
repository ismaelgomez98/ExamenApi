import 'package:dio/dio.dart';
import 'package:exame_api/src/models/clima_models.dart';

class ClimaProvider {
  final _url = 'https://www.metaweather.com/api/location/search/?query=san';
  final _http = Dio();

  Future<List<ClimaModels>> obtenerClima() async {
    final response = await _http.get(_url);
    List<dynamic> data = response.data;
    return data
        .map((clima) => ClimaModels.transformarInstancia(clima))
        .toList();
  }
}
