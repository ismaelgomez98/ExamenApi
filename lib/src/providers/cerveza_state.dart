import 'package:exame_api/src/models/cerveza_models.dart';
import 'package:exame_api/src/providers/cerveza_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CervezaState extends GetxController {
  List<CervezaModels> cerveza = [];
  final cervezaProvider = CervezaProvider();

  Future<void> obtenerCervezas() async {
    cerveza.addAll(await cervezaProvider.obtenerCervezas(10));
    update();
  }
}
