import 'package:desafio_studio_sol/global_vars.dart';
import 'package:desafio_studio_sol/src/models/response_model.dart';
import 'package:desafio_studio_sol/src/repositories/profile_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<String> getUserPicture() async {
    String readRepositories = """
      query userPictureQuery {
        userPicture
      }
""";
    final result = await api.value.get(readRepositories);
    return (result as ResponseModel<QueryResult>).response?.data!["userPicture"]
        as String;
  }
}
