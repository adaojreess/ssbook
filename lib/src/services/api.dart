import 'package:desafio_studio_sol/src/models/response_model.dart';

abstract class API {
  API(this.apiUrl);
  String? apiUrl;
  Future<ResponseModel> get(String path);
}
