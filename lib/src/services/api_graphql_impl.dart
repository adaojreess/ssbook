import 'package:desafio_studio_sol/src/models/response_model.dart';
import 'package:desafio_studio_sol/src/services/api.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:gql/ast.dart';

class APIGraphQL implements API {
  late GraphQLClient client;
  APIGraphQL(String apiUrl) {
    this.apiUrl = apiUrl;
    client = GraphQLClient(
      link: HttpLink(apiUrl),
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    );
  }

  @override
  String? apiUrl;

  @override
  Future<ResponseModel<QueryResult<Object?>>> get(String path) async {
    final result = await client.query(QueryOptions(document: gql(path)));
    return ResponseModel(response: result);
  }
}
